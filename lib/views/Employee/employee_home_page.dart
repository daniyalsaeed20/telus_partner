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
import 'package:telus_partner_non_responsive/controllers/leads_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';
import 'package:telus_partner_non_responsive/views/cards/add_porting_request_button.dart';
import 'package:telus_partner_non_responsive/views/cards/customer_interest_oppertunity_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employee_cards/customer_personal_information_card.dart';
import 'package:telus_partner_non_responsive/views/cards/employee_cards/lead_card.dart';
import 'package:telus_partner_non_responsive/views/cards/leads_tile.dart';
import 'package:telus_partner_non_responsive/views/cards/porting_info_card.dart';
import 'package:telus_partner_non_responsive/views/cards/profile_home_card.dart';
import 'package:telus_partner_non_responsive/views/cards/settings_card.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';

class EmployeeHomePage extends StatefulWidget {
  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
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
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () {
          UserDataController.selectedTab = 0;
          dbController.getEmployeeLeads();
          userDataController.update();
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Submission History',
        icon: Icons.history_edu,
        onPressed: () {
          UserDataController.selectedTab = 1;
          // dbController.getEmployeeLeads();
          userDataController.update();
        },
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () {
          UserDataController.selectedTab = 2;
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
                ? dasboardTab(Get.size, context)
                : UserDataController.selectedTab == 1
                    ? submissionHistoryTab(Get.size, context)
                    : settingsTab(Get.size, context),
          ),
        );
      },
    );
  }

  Widget dasboardTab(Size size, BuildContext context) {
    DbController dbController = Get.put(DbController());
    return GetBuilder<LeadsController>(
      init: LeadsController(),
      builder: (leadsController) {
        return Container(
          height: Get.height,
          width: Get.width,
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Column(
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
                                      text: leadsController.approvedLeads
                                          .toString(),
                                      icon: Icons.check,
                                      labelText: "Leads Approved",
                                    ),
                                    leadCard(
                                      color: orange,
                                      headingText: "Pending",
                                      text: leadsController.pendingLeads
                                          .toString(),
                                      icon: Icons.menu,
                                      labelText: "Leads Pending",
                                    ),
                                    leadCard(
                                      color: red,
                                      headingText: "Canceled",
                                      text: leadsController.canceledLeads
                                          .toString(),
                                      icon: Icons.close,
                                      labelText: "Leads Canceled",
                                    ),
                                    leadCard(
                                      color: purpleDark,
                                      headingText: "All",
                                      text: (leadsController.approvedLeads +
                                              leadsController.pendingLeads +
                                              leadsController.canceledLeads)
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
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 16.0,
                              ),
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
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            bottom: 48,
                                            left: 16,
                                            right: 16,
                                          ),
                                          child: customHeading(
                                            text: "Submit",
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
                                  ],
                                ),
                              ),
                            ),
                            Form(
                              key: leadsController.suibmitLeadsFormKey,
                              child: Column(
                                children: [
                                  /* -------------------------------------------------------------------------- */
                                  /*                               Representative                               */
                                  /* -------------------------------------------------------------------------- */
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      bottom: 16.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 5,
                                            spreadRadius: 0.1,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 16,
                                              ),
                                              child: customHeading(
                                                text:
                                                    "Representative Information",
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Divider(
                                                height: 1,
                                                color: greenLight,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                label: "Partner Company Name",
                                                controller: leadsController
                                                    .partnerCompanyNameController,
                                                validator: fieldValidator,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .representativeNameController,
                                                label: "Representative Name",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .representativePhoneNumberController,
                                                label:
                                                    "Representative Phone Number",
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 16,
                                              ),
                                              child: customHeading(
                                                text:
                                                    "Customer Interest Opportunity",
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Wrap(
                                              runSpacing: 25, spacing:25,
                                              alignment: WrapAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerInterestOppertunityCard(text: "Personal Wireless"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerInterestOppertunityCard(text: "Business Wireless"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerInterestOppertunityCard(text: "TELUS Secure Business"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerInterestOppertunityCard(text: "Business Internet"),
                                                ),
                                              ],
                                            ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.all(8.0),
                                            //   child: customInputTextfield(
                                            //     validator: fieldValidator,
                                            //     controller: leadsController
                                            //         .customerInterestOpportunityController,
                                            //     label:
                                            //         "Customer Interest Opportunity",
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  /* -------------------------------------------------------------------------- */
                                  /*                                  Customer                                  */
                                  /* -------------------------------------------------------------------------- */
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      bottom: 16.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 5,
                                            spreadRadius: 0.1,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 16,
                                              ),
                                              child: customHeading(
                                                text: "Customer Information",
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Divider(
                                                height: 1,
                                                color: greenLight,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerNameController,
                                                label: "Name",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerContactPhoneNumberController,
                                                label: "Contact Phone Number",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerAddressController,
                                                label: "Address",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerCityController,
                                                label: "City",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerProvinceController,
                                                label: "Province",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerPostalCodeController,
                                                label: "Postal Code",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerEmailController,
                                                label: "Email",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerDateOfBirthController,
                                                label: "Date of Birth",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerBusinessHSTController,
                                                label:
                                                    "Business | HST # (If Applicable)",
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 16,
                                              ),
                                              child: customHeading(
                                                text:
                                                    "Personal Information",
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Wrap(
                                              runSpacing: 25, spacing:25,
                                              alignment: WrapAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerPersonalInformationCard(text: "Driving Licence"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerPersonalInformationCard(text: "Canadian Passport"),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: customerPersonalInformationCard(text: "Social Insurance"),
                                                ),
                                              ],
                                            ),
                                            if(leadsController.customerPersonalInformationController.text == "Driving Licence")
                                            Column(
                                              children: [
                                                Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController.customerPersonalInformationFirstController,
                                                label: "${leadsController.customerPersonalInformationController.text} #",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController.customerPersonalInformationSecondController,
                                                label: "Expiry Date",
                                              ),
                                            ),
                                              ],
                                            ),
                                            if(leadsController.customerPersonalInformationController.text == "Canadian Passport")
                                            Column(
                                              children: [
                                                Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController.customerPersonalInformationFirstController,
                                                label: "${leadsController.customerPersonalInformationController.text} #",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController.customerPersonalInformationSecondController,
                                                label: "Expiry Date",
                                              ),
                                            ),
                                              ],
                                            ),
                                            if(leadsController.customerPersonalInformationController.text == "Social Insurance")
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController.customerPersonalInformationFirstController,
                                                label: "${leadsController.customerPersonalInformationController.text} #",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customInputTextfield(
                                                validator: fieldValidator,
                                                controller: leadsController
                                                    .customerPackageDetailsController,
                                                label:
                                                    "Plan, Devices & Package Details",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  /* -------------------------------------------------------------------------- */
                                  /*                            Porting Request Info                            */
                                  /* -------------------------------------------------------------------------- */
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16,
                                      ),
                                      child: customHeading(
                                        text: "Porting Request Information",
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Divider(
                                      height: 1,
                                      color: greenLight,
                                    ),
                                  ),
                                  for (int index = 0;
                                      index < leadsController.portingInfoCount;
                                      index++)
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: portingInfoCard(index),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: addPortingReuestButton(
                                      function: () {
                                        leadsController.portingInfoCount =
                                            leadsController.portingInfoCount +
                                                1;
                                        leadsController
                                            .addPortingRequesstFields();
                                        leadsController.update();
                                      },
                                    ),
                                  ),
                                  /* -------------------------------------------------------------------------- */
                                  /*                                   Submit                                   */
                                  /* -------------------------------------------------------------------------- */
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      bottom: 16.0,
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: Get.width / 2,
                                        child: customButton(
                                          function: () {
                                            dbController.submitLeads();
                                            leadsController.portingInfoCount =
                                                0;
                                          },
                                          text: "Submit",
                                          textColor: white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
                            padding: const EdgeInsets.only(
                              bottom: 32,
                              left: 16,
                              right: 16,
                            ),
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
                                customerContactPhoneNumber: lead.customerContactPhoneNumber,
                                customerInterestOpportunity: lead.customerInterestOpportunity,
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
                                representativePhoneNumber: lead.representativePhoneNumber,

                                
                              );
                            },
                            query: dbController.leadsCollection
                                .where("employeeId",
                                    isEqualTo: userDataController
                                        .userDataModel.reference.id)
                                .orderBy("date",descending: true),
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
