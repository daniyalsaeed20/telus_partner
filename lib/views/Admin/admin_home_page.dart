// ignore_for_file: use_key_in_widget_constructors

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/constants/helper_functions.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/employee_controller.dart';
import 'package:telus_partner_non_responsive/controllers/leads_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';
import 'package:telus_partner_non_responsive/views/cards/add_employee_card.dart';
import 'package:telus_partner_non_responsive/views/cards/add_porting_request_button.dart';
import 'package:telus_partner_non_responsive/views/cards/admin_cards/organizations_list_card.dart';
import 'package:telus_partner_non_responsive/views/cards/customer_interest_oppertunity_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employee_cards/customer_personal_information_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employee_cards/lead_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employees_list.dart';
import 'package:telus_partner_non_responsive/views/cards/leads_tile.dart';
import 'package:telus_partner_non_responsive/views/cards/porting_info_card.dart';
import 'package:telus_partner_non_responsive/views/cards/profile_home_card.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';

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
        text: 'Organizations',
        icon: Icons.business_center_outlined,
        onPressed: () {
          UserDataController.selectedTab = 0;
          userDataController.update();
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Manage',
        icon: Icons.manage_accounts_outlined,
        onPressed: () {
          UserDataController.selectedTab = 1;
          dbController.getOrganizationLeads();
          // dbController.getEmployeeLeads();
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'Requests',
        icon: Icons.people,
        onPressed: () {
          UserDataController.selectedTab = 2;
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
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () {
          UserDataController.selectedTab = 4;
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
                ? organizationsTab(Get.size, context)
                : UserDataController.selectedTab == 1
                    ? submissionHistoryTab(Get.size, context)
                    : UserDataController.selectedTab == 2
                        ? employeesTab(Get.size, context)
                        : UserDataController.selectedTab == 3
                            ? leadsTab(Get.size, context)
                            : settingsTab(Get.size, context),
          ),
        );
      },
    );
  }

  Widget organizationsTab(Size size, BuildContext context) {
    DbController dbController = Get.put(DbController());
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          profileHomeCard(),
          Container(
            width: Get.width,
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
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  organizationsListCard(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 128,
                    ),
                    child: employeesList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submissionHistoryTab(Size size, BuildContext context) {
    DbController dbController = Get.put(DbController());
    UserDataController userDataController = Get.put(UserDataController());
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
                  child: SizedBox(
                    height: 570,
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
                                  width: 200,
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
                              );
                            },
                            query: dbController.leadsCollection
                                .where("employeeId",
                                    isEqualTo: userDataController
                                        .userDataModel.reference.id)
                                .orderBy("date", descending: true),
                            isLive: true,
                          ),
                        ],
                      ),
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

  Widget employeesTab(Size size, BuildContext context) {
    return Container(
      color: backgroundColor,
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            profileHomeCard(),
            GetBuilder<UserDataController>(
                init: UserDataController(),
                builder: (userDataController) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 128,
                    ),
                    child: addEmployeeCard(
                        text: "Add Agent",
                        function: () {
                          EmployeeController employeeController =
                              Get.put(EmployeeController());
                          employeeController.saveEmployee();
                          UserDataController.clearFields();
                          userDataController.update();
                        }),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 128,
              ),
              child: employeesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget leadsTab(Size size, BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  Widget settingsTab(Size size, BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
