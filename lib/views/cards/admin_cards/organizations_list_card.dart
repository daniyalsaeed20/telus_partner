import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget organizationsListCard() {
  DbController dbController = Get.put(DbController());
  OrganizationController organizationController =
      Get.put(OrganizationController());
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customHeading(
            text: "Organizations",
            fontSize: 24,
          ),
        ),
        Container(
          height: 500,
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
            child: Column(
              children: [
                PaginateFirestore(
                  shrinkWrap: true,
                  itemBuilderType:
                      PaginateBuilderType.listView,
                  itemBuilder: (index, context, documentSnapshot) {
                    OrganizationModel organizationModel =
                        OrganizationModel.fromDocumentSnapshot(
                            documentSnapshot);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          organizationController.selectedOrganizationModel =
                              organizationModel;
                        },
                        child: organizationsCard(
                          name: organizationModel.name,
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
  );
}

Widget organizationsCard({
  name = "...",
}) {
  OrganizationController organizationController =
      Get.put(OrganizationController());
  return Container(
    height: 50,
    constraints: const BoxConstraints(
      maxWidth: 600,
      minWidth: 300,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: name == organizationController.selectedOrganizationModel
          ? purpleDark
          : white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 5,
          spreadRadius: 0.1,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: customText(
      text: name,
      textColor: name == organizationController.selectedOrganizationModel
          ? white
          : purpleDark,
    ),
  );
}
