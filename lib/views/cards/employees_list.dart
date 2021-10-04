import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';
import 'package:telus_partner_non_responsive/models/user_data_model.dart';
import 'package:telus_partner_non_responsive/views/cards/leads_tile.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget employeesList({
  controller,
}) {
  return GetBuilder<OrganizationController>(
    id: 7829,
      init: OrganizationController(),
      builder: (organizationController) {
        return GetBuilder<DbController>(
            init: DbController(),
            builder: (dbController) {
              return Container(
                // height: 600,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      blurRadius: 7,
                      spreadRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  color: white,
                ),
                child: Wrap(
                  // alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[400],
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          color: white,
                        ),
                        width: 650,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: customHeading(
                                      text: "Name",
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: customHeading(
                                      text: "Date Added",
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: customHeading(
                                      text: "Submissions",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 500,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    if (organizationController
                                            .selectedOrganizationModel
                                            .reference !=
                                        null)
                                      PaginateFirestore(
                                        shrinkWrap: true,
                                        // Use SliverAppBar in header to make it sticky

                                        // item builder type is compulsory.
                                        itemBuilderType: PaginateBuilderType
                                            .listView, //Change types accordingly
                                        itemBuilder:
                                            (index, context, documentSnapshot) {
                                          UserDataModel userModel = UserDataModel(
                                            email: documentSnapshot["email"],
                                            firstName:
                                                documentSnapshot["firstName"],
                                            isAllowed:
                                                documentSnapshot["isAllowed"],
                                            lastName:
                                                documentSnapshot["lastName"],
                                            leadIds: documentSnapshot["leadIds"],
                                            organization:
                                                documentSnapshot["organization"],
                                            password:
                                                documentSnapshot["password"],
                                            dateAdded:
                                                documentSnapshot["dateAdded"],
                                            reference: documentSnapshot.reference,
                                            type: documentSnapshot["type"],
                                          );

                                          return userModel.type == "Manager"
                                              ? employeeListCard(
                                                  userModel,
                                                  controller: dbController,
                                                )
                                              : Container();
                                        },
                                        query: dbController.userCollection.where(
                                            "organization",
                                            isEqualTo: organizationController
                                                .selectedOrganizationModel
                                                .reference
                                                .id
                                                .toString()),
                                        isLive: true,
                                        
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[400],
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          color: white,
                        ),
                        width: 650,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: customHeading(
                                      text: "Name",
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: customHeading(
                                      text: "Date Added",
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: customHeading(
                                      text: "Submissions",
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 500,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    if (organizationController
                                            .selectedOrganizationModel
                                            .reference !=
                                        null)
                                      PaginateFirestore(
                                        shrinkWrap: true,
                                        // Use SliverAppBar in header to make it sticky

                                        // item builder type is compulsory.
                                        itemBuilderType: PaginateBuilderType
                                            .listView, //Change types accordingly
                                        itemBuilder:
                                            (index, context, documentSnapshot) {
                                          UserDataModel userModel = UserDataModel(
                                            email: documentSnapshot["email"],
                                            firstName:
                                                documentSnapshot["firstName"],
                                            isAllowed:
                                                documentSnapshot["isAllowed"],
                                            lastName:
                                                documentSnapshot["lastName"],
                                            leadIds: documentSnapshot["leadIds"],
                                            organization:
                                                documentSnapshot["organization"],
                                            password:
                                                documentSnapshot["password"],
                                            dateAdded:
                                                documentSnapshot["dateAdded"],
                                            reference: documentSnapshot.reference,
                                            type: documentSnapshot["type"],
                                          );

                                          return userModel.type == "Employee"
                                              ? employeeListCard(
                                                  userModel,
                                                  controller: dbController,
                                                )
                                              : Container();
                                        },
                                        query: dbController.userCollection.where(
                                            "organization",
                                            isEqualTo: organizationController
                                                .selectedOrganizationModel
                                                .reference
                                                .id
                                                .toString()),
                                        isLive: true,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      });
}

Widget employeeListCard(UserDataModel userModel, {controller}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 32,
          right: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 50,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  "assets/default_profile.png",
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: customText(
                fontSize: 14,
                text: userModel.firstName + " " + userModel.lastName,
              ),
            ),
            SizedBox(
              width: 130,
              child: customText(
                fontSize: 14,
                text: userModel.dateAdded,
              ),
            ),
            SizedBox(
              width: 130,
              child: customText(
                fontSize: 14,
                text: userModel.leadIds.toString(),
              ),
            ),
            SizedBox(
              width: 50,
              child: InkWell(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: EdgeInsets.zero,
                      insetPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 48,
                      ),
                      backgroundColor: Colors.white,
                      content: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
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
                                    itemBuilder:
                                        (index, context, documentSnapshot) {
                                      Leads lead = Leads.fromDocumentSnapshot(
                                          documentSnapshot);
                                      return leadTile(
                                        status: lead.status,
                                        date: lead.date,
                                        time: lead.time,
                                        clientName: lead.customerName,
                                        additionalInfo:
                                            lead.customerPackageDetails,
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
                                      );
                                    },
                                    query: controller.leadsCollection
                                        .where("employeeId",
                                            isEqualTo: userModel.reference.id)
                                        .orderBy("date", descending: true),
                                    isLive: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        height: 650,
                        width: Get.width,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 128,
        ),
        child: Divider(
          height: 1,
          color: greenLight,
        ),
      ),
    ],
  );
}
