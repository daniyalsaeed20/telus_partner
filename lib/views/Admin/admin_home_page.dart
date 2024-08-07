// ignore_for_file: use_key_in_widget_constructors

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/employee_controller.dart';
import 'package:telus_partner_non_responsive/controllers/leads_controller.dart';
import 'package:telus_partner_non_responsive/controllers/notifications_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';
import 'package:telus_partner_non_responsive/models/notifications_model.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';
import 'package:telus_partner_non_responsive/views/Admin/notification_card.dart';
import 'package:telus_partner_non_responsive/views/cards/add_employee_card.dart';
import 'package:telus_partner_non_responsive/views/cards/add_organization.dart';
import 'package:telus_partner_non_responsive/views/cards/admin_cards/organization_summary_card.dart';
import 'package:telus_partner_non_responsive/views/cards/admin_cards/organizations_list_card.dart';
import 'package:telus_partner_non_responsive/views/cards/admin_cards/request_list_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employee_cards/lead_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employees_list.dart';
import 'package:telus_partner_non_responsive/views/cards/leads_tile.dart';
import 'package:telus_partner_non_responsive/views/cards/profile_home_card.dart';
import 'package:telus_partner_non_responsive/views/cards/settings_card.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<CollapsibleItem> _items;
  final AssetImage _avatarImg = const AssetImage('assets/default_profile.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;

    // EmployeeController.selectedTab = int.parse(_items.firstWhere((item) => item.isSelected).text);
  }

  List<CollapsibleItem> get _generateItems {
    UserDataController userDataController = Get.put(UserDataController());
    DbController dbController = Get.put(DbController());

    return [
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home_outlined,
        onPressed: () {
          dbController.getAdminLeads();
          UserDataController.selectedTab = 0;
          userDataController.update();
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Organizations',
        icon: Icons.business_center_outlined,
        onPressed: () {
          UserDataController.selectedTab = 1;
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'Manage',
        icon: Icons.manage_accounts_outlined,
        onPressed: () {
          UserDataController.selectedTab = 2;
          dbController.getOrganizationLeads();
          // dbController.getEmployeeLeads();
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'Leads',
        icon: Icons.leaderboard_sharp,
        onPressed: () {
          UserDataController.selectedTab = 3;
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'Leads Notifications',
        icon: Icons.edit_notifications_outlined,
        onPressed: () {
          dbController.getLeadNotifications();
          UserDataController.selectedTab = 4;
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'General',
        icon: Icons.notification_add_outlined,
        onPressed: () {
          dbController.getGeneralNotifications();
          UserDataController.selectedTab = 5;
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () {
          UserDataController.selectedTab = 6;
          userDataController.update();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(
      init: UserDataController(),
      builder: (userDataController) {
        return SafeArea(
          child: CollapsibleSidebar(
            isCollapsed: true,
            items: _items,
            avatarImg: _avatarImg,
            title: userDataController.userDataModel == null
                ? "..."
                : userDataController.userDataModel.firstName +
                    " " +
                    userDataController.userDataModel.lastName,
            backgroundColor: white,
            selectedTextColor: backgroundColor,
            selectedIconBox: purpleDark,
            selectedIconColor: backgroundColor,
            unselectedIconColor: Colors.grey[400],
            unselectedTextColor: Colors.grey[600],
            textStyle: const TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
            titleStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            toggleTitleStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            sidebarBoxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 50,
                spreadRadius: 0.01,
                offset: const Offset(3, 3),
              ),
            ],
            body: UserDataController.selectedTab == 0
                ? homeTab(Get.size, context)
                : UserDataController.selectedTab == 1
                    ? organizationsTab(Get.size, context)
                    : UserDataController.selectedTab == 2
                        ? manageTab(Get.size, context)
                        : UserDataController.selectedTab == 3
                            ? leadsTab(Get.size, context)
                            : UserDataController.selectedTab == 4
                                ? leadsNotificationTab(Get.size, context)
                                : UserDataController.selectedTab == 5
                                    ? generalNotificationTab(Get.size, context)
                                    : settingsTab(Get.size, context),
          ),
        );
      },
    );
  }

  Widget homeTab(Size size, BuildContext context) {
    return GetBuilder<DbController>(
      init: DbController(),
      builder: (dbController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  profileHomeCard(),
                  GetBuilder<LeadsController>(
                      init: LeadsController(),
                      builder: (leadsController) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5,
                                  spreadRadius: 0.1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          bottom: 48,
                                        ),
                                        child: customHeading(
                                          text: "Leads Summary",
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Divider(
                                      height: 1,
                                      color: greenLight,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 128),
                                    child: Wrap(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      alignment: WrapAlignment.center,
                                      runSpacing: 70,
                                      spacing: 70,
                                      children: [
                                        leadCard(
                                          color: greenLight,
                                          headingText: "Approved",
                                          text: leadsController
                                                      .adminApprovedLeads ==
                                                  null
                                              ? "0"
                                              : leadsController
                                                  .adminApprovedLeads
                                                  .toString(),
                                          icon: Icons.check,
                                          labelText: "Leads Approved",
                                        ),
                                        leadCard(
                                          color: orange,
                                          headingText: "Pending",
                                          text: leadsController
                                                      .adminPendingLeads ==
                                                  null
                                              ? "0"
                                              : leadsController
                                                  .adminPendingLeads
                                                  .toString(),
                                          icon: Icons.menu,
                                          labelText: "Leads Pending",
                                        ),
                                        leadCard(
                                          color: red,
                                          headingText: "Canceled",
                                          text: leadsController
                                                      .adminCanceledLeads ==
                                                  null
                                              ? "0"
                                              : leadsController
                                                  .adminCanceledLeads
                                                  .toString(),
                                          icon: Icons.close,
                                          labelText: "Leads Canceled",
                                        ),
                                        leadCard(
                                          color: purpleDark,
                                          headingText: "All",
                                          text: (leadsController
                                                          .adminApprovedLeads ==
                                                      null
                                                  ? 0
                                                  : leadsController
                                                                  .adminApprovedLeads +
                                                              leadsController
                                                                  .adminPendingLeads ==
                                                          null
                                                      ? 0
                                                      : leadsController
                                                                      .adminPendingLeads +
                                                                  leadsController
                                                                      .adminCanceledLeads ==
                                                              null
                                                          ? 0
                                                          : leadsController
                                                              .adminCanceledLeads)
                                              .toString(),
                                          icon: Icons.code,
                                          labelText: "All Leads",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 570,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 0.1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16,
                                      bottom: 48,
                                    ),
                                    child: customHeading(
                                      text: "Recent Submissions",
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      UserDataController userDataController =
                                          Get.put(UserDataController());
                                      UserDataController.selectedTab = 3;
                                      userDataController.update();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 48,
                                      ),
                                      child: customHeading(
                                        text: "> View All Leads",
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        headingColor: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Divider(
                                  height: 1,
                                  color: greenLight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: customHeading(text: "Title"),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: customHeading(
                                          text: "Submission Date"),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: customHeading(
                                          text: "Submission Time"),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: customHeading(text: "Status"),
                                    ),
                                    const SizedBox(
                                      width: 200,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              PaginateFirestore(
                                shrinkWrap: true,
                                // Use SliverAppBar in header to make it sticky

                                // item builder type is compulsory.
                                itemBuilderType: PaginateBuilderType
                                    .listView, //Change types accordingly
                                itemBuilder:
                                    (index, context, documentSnapshot) {
                                  Leads lead = Leads.fromDocumentSnapshot(
                                      documentSnapshot);

                                  return index < 5
                                      ? leadTile(
                                          status: lead.status,
                                          date: lead.date,
                                          time: lead.time,
                                          clientName: lead.customerName,
                                          additionalInfo:
                                              lead.customerPackageDetails,
                                          clientEmail: lead.customerEmail,
                                          employeeEmail: lead.employeeId,
                                          employeeName: lead.representativeName,
                                          portingInfoModel:
                                              lead.portingRequests,
                                          address: lead.customerAddress,
                                          city: lead.customerCity,
                                          customerContactPhoneNumber:
                                              lead.customerContactPhoneNumber,
                                          customerInterestOpportunity:
                                              lead.customerInterestOpportunity,
                                          customerName: lead.customerName,
                                          dob: lead.customerDateOfBirth,
                                          email: lead.customerEmail,
                                          hst: lead.customerBusinessHST,
                                          packageDetails:
                                              lead.customerPackageDetails,
                                          partnerCompanyName:
                                              lead.partnerCompanyName,
                                          personalInfo:
                                              lead.customerPersonalInformation,
                                          postalCode: lead.customerPostalCode,
                                          province: lead.customerProvince,
                                          representativeName:
                                              lead.representativeName,
                                          representativePhoneNumber:
                                              lead.representativePhoneNumber,
                                          changeStatusFunction: () {
                                            UserDataController
                                                userDataController =
                                                Get.put(UserDataController());

                                            if (userDataController
                                                    .userDataModel.type ==
                                                "Admin") {
                                              Get.dialog(
                                                AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 48,
                                                    vertical: 48,
                                                  ),
                                                  insetPadding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 48,
                                                  ),
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.5),
                                                  content: SizedBox(
                                                    height: 200,
                                                    width: 500,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              customHeading(
                                                                text:
                                                                    "Change Status",
                                                                headingColor:
                                                                    white,
                                                                fontSize: 20,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Wrap(
                                                          alignment:
                                                              WrapAlignment
                                                                  .center,
                                                          runSpacing: 25,
                                                          spacing: 25,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                dbController
                                                                    .changeLeadStatus(
                                                                        "Completed",
                                                                        lead);
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                height: 75,
                                                                width: 75,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              90),
                                                                  color: white,
                                                                ),
                                                                child: Icon(
                                                                  Icons.check,
                                                                  color: green,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                dbController
                                                                    .changeLeadStatus(
                                                                        "Canceled",
                                                                        lead);
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                height: 75,
                                                                width: 75,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              90),
                                                                  color: white,
                                                                ),
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: red,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        )
                                      : Container();
                                },
                                query: dbController.leadsCollection
                                    .orderBy("date", descending: true),
                                isLive: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget organizationsTab(Size size, BuildContext context) {
    UserDataController userDataController = Get.put(UserDataController());
    return GetBuilder<DbController>(
      init: DbController(),
      builder: (dbController) {
        return GetBuilder<OrganizationController>(
          init: OrganizationController(),
          builder: (organizationController) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      profileHomeCard(),
                      organizationsListCard(),
                      organizationSummaryCard(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          // vertical: 32,
                          horizontal: 32,
                        ),
                        child: employeesList(
                          controller: userDataController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget manageTab(Size size, BuildContext context) {
    DbController dbController = Get.put(DbController());
    UserDataController userDataController = Get.put(UserDataController());
    OrganizationController organizationController =
        Get.put(OrganizationController());
    return Container(
      color: backgroundColor,
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            profileHomeCard(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    addOrganizationCard(function: () {
                      organizationController.addOrganization();
                      organizationController.clearFields();
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: requestListCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 409),
                        child: GetBuilder<UserDataController>(
                            init: UserDataController(),
                            builder: (userDataController) {
                              return addEmployeeCard(
                                  text: "Add Employee",
                                  function: () {
                                    EmployeeController employeeController =
                                        Get.put(EmployeeController());
                                    employeeController.saveEmployee(
                                      type: userDataController.selectedUserType,
                                    );
                                    if (userDataController
                                            .selectedUserModel.reference !=
                                        null) {
                                      dbController.deleteEmployee(
                                          userDataController.selectedUserModel);
                                    }
                                    UserDataController.clearFields();
                                    userDataController.selectedUserType = "";
                                    organizationController
                                            .selectedOrganizationModel =
                                        OrganizationModel();
                                    userDataController.update();
                                  });
                            }),
                      ),
                    ),
                    organizationsListCard(
                      leadsRequired: false,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leadsTab(Size size, BuildContext context) {
    DbController dbController = Get.put(DbController());
    return Container(
      color: backgroundColor,
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            profileHomeCard(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 570,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 0.1,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                bottom: 48,
                              ),
                              child: customHeading(
                                text: "Leads History",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Divider(
                            height: 1,
                            color: greenLight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 200,
                                child: customHeading(text: "Title"),
                              ),
                              SizedBox(
                                width: 200,
                                child: customHeading(text: "Submission Date"),
                              ),
                              SizedBox(
                                width: 200,
                                child: customHeading(text: "Submission Time"),
                              ),
                              SizedBox(
                                width: 200,
                                child: customHeading(text: "Status"),
                              ),
                              const SizedBox(
                                width: 200,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        PaginateFirestore(
                          shrinkWrap: true,
                          // Use SliverAppBar in header to make it sticky

                          // item builder type is compulsory.
                          itemBuilderType: PaginateBuilderType
                              .listView, //Change types accordingly
                          itemBuilder: (index, context, documentSnapshot) {
                            Leads lead =
                                Leads.fromDocumentSnapshot(documentSnapshot);

                            return leadTile(
                              status: lead.status,
                              date: lead.date,
                              time: lead.time,
                              clientName: lead.customerName,
                              additionalInfo: lead.customerPackageDetails,
                              clientEmail: lead.customerEmail,
                              employeeEmail: lead.employeeId,
                              employeeName: lead.representativeName,
                              portingInfoModel: lead.portingRequests,
                              address: lead.customerAddress,
                              city: lead.customerCity,
                              customerContactPhoneNumber:
                                  lead.customerContactPhoneNumber,
                              customerInterestOpportunity:
                                  lead.customerInterestOpportunity,
                              customerName: lead.customerName,
                              dob: lead.customerDateOfBirth,
                              email: lead.customerEmail,
                              hst: lead.customerBusinessHST,
                              packageDetails: lead.customerPackageDetails,
                              partnerCompanyName: lead.partnerCompanyName,
                              personalInfo: lead.customerPersonalInformation,
                              postalCode: lead.customerPostalCode,
                              province: lead.customerProvince,
                              representativeName: lead.representativeName,
                              representativePhoneNumber:
                                  lead.representativePhoneNumber,
                              changeStatusFunction: () {
                                UserDataController userDataController =
                                    Get.put(UserDataController());

                                if (userDataController.userDataModel.type ==
                                    "Admin") {
                                  Get.dialog(
                                    AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 48,
                                        vertical: 48,
                                      ),
                                      insetPadding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 48,
                                      ),
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                      content: SizedBox(
                                        height: 200,
                                        width: 500,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  customHeading(
                                                    text: "Change Status",
                                                    headingColor: white,
                                                    fontSize: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Wrap(
                                              alignment: WrapAlignment.center,
                                              runSpacing: 25,
                                              spacing: 25,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    dbController
                                                        .changeLeadStatus(
                                                            "Completed", lead);
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: 75,
                                                    width: 75,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90),
                                                      color: white,
                                                    ),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: green,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    dbController
                                                        .changeLeadStatus(
                                                            "Canceled", lead);
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    height: 75,
                                                    width: 75,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90),
                                                      color: white,
                                                    ),
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: red,
                                                      size: 50,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          query: dbController.leadsCollection
                              .orderBy("date", descending: true),
                          isLive: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leadsNotificationTab(Size size, BuildContext context) {
    return GetBuilder<DbController>(
      init: DbController(),
      builder: (dbController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  profileHomeCard(),
                  GetBuilder<NotificationController>(
                    init: NotificationController(),
                    builder: (notificationController) {
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 570,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 0.1,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          bottom: 48,
                                        ),
                                        child: customHeading(
                                          text: "Lead Notifications",
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Divider(
                                      height: 1,
                                      color: greenLight,
                                    ),
                                  ),
                                  for(int i = 0; i < notificationController.leadsNotifications.length;i++)
                                  notificationCard(
                                    name: notificationController.leadsNotifications[i].name,
                                    date: notificationController.leadsNotifications[i].date,
                                    isLead: notificationController.leadsNotifications[i].isLead,
                                    isSignup: notificationController.leadsNotifications[i].isSignUp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget generalNotificationTab(Size size, BuildContext context) {
    return GetBuilder<DbController>(
      init: DbController(),
      builder: (dbController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  profileHomeCard(),
                  GetBuilder<NotificationController>(
                    init: NotificationController(),
                    builder: (notificationController) {
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 570,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 0.1,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 16,
                                          bottom: 48,
                                        ),
                                        child: customHeading(
                                          text: "General Notifications",
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Divider(
                                      height: 1,
                                      color: greenLight,
                                    ),
                                  ),
                                  for(int i = 0; i < notificationController.generalNotifications.length;i++)
                                  notificationCard(
                                    name: notificationController.generalNotifications[i].name,
                                    date: notificationController.generalNotifications[i].date,
                                    isLead: notificationController.generalNotifications[i].isLead,
                                    isSignup: notificationController.generalNotifications[i].isSignUp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget settingsTab(Size size, BuildContext context) {
    return GetBuilder<DbController>(
      init: DbController(),
      builder: (dbController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  profileHomeCard(),
                  settingsCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
