import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget organizationsListCard({
  leadsRequired = true,
}) {
  DbController dbController = Get.put(DbController());
  return GetBuilder<OrganizationController>(
      init: OrganizationController(),
      builder: (organizationController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 428,
            constraints: const BoxConstraints(
              maxWidth: 614,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      customHeading(
                        text: "All Organizations",
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 175,
                            child: customHeading(
                              text: "Title",
                              headingColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: customHeading(
                              text: "Employees",
                              headingColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: customHeading(
                              text: "Managers",
                              headingColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: customHeading(
                              text: "Date Added",
                              headingColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 45,
                        ),
                        child: Divider(
                          height: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              PaginateFirestore(
                                shrinkWrap: true,
                                itemBuilderType: PaginateBuilderType.listView,
                                itemBuilder: (index, context, documentSnapshot) {
                                  OrganizationModel organizationModel =
                                      OrganizationModel.fromDocumentSnapshot(
                                          documentSnapshot);
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        organizationController
                                                .selectedOrganizationModel =
                                            organizationModel;
                                            if(leadsRequired == true){
                                              organizationController.getOrganizationLeads();
                                            }
                                            dbController.update();
                                        organizationController.update();
                                        organizationController.update([7829], true);
                                      },
                                      child: organizationsCard(
                                        name: organizationModel.name,
                                        dateAdded: organizationModel.dateAdded,
                                        totalEmployees:
                                            organizationModel.totalEmployees.toString(),
                                        totalManagers:
                                            organizationModel.totalManagers.toString(),
                                      ),
                                    ),
                                  );
                                },
                                query: dbController.organizationCollection,
                                isLive: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget organizationsCard({
  name = "...",
  totalEmployees = "...",
  totalManagers = "...",
  dateAdded = "...",
}) {
  OrganizationController organizationController =
      Get.put(OrganizationController());
  return Column(
    children: [
      Container(
        color: name == organizationController.selectedOrganizationModel.name
            ? purple
            : white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 175,
                child: customText(
                  text: name,
                  textColor: name !=
                          organizationController.selectedOrganizationModel.name
                      ? Colors.black
                      : white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 75,
                child: customText(
                  text: totalEmployees,
                  textColor: name !=
                          organizationController.selectedOrganizationModel.name
                      ? Colors.grey
                      : white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 75,
                child: customText(
                  text: totalManagers,
                  textColor: name !=
                          organizationController.selectedOrganizationModel.name
                      ? Colors.grey
                      : white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 100,
                child: customText(
                  text: dateAdded,
                  textColor: name !=
                          organizationController.selectedOrganizationModel.name
                      ? Colors.grey
                      : white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 45,
        ),
        child: Divider(
          height: 0.5,
          color: Colors.grey[400],
        ),
      ),
    ],
  );
}
