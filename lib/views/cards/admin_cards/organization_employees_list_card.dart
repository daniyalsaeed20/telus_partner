import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/user_data_model.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget organizationEmployeesListCard() {
  DbController dbController = Get.put(DbController());
  OrganizationController organizationController =
      Get.put(OrganizationController());
  UserDataController userDataController = Get.put(UserDataController());
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customHeading(
            text: "Employees",
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
                  itemBuilderType: PaginateBuilderType.listView,
                  itemBuilder: (index, context, documentSnapshot) {
                    UserDataModel organizationEmployee =
                        UserDataModel.fromDocumentSnapshot(documentSnapshot);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          userDataController.selectedEmployee =
                              organizationEmployee;
                        },
                        child: employeeCard(
                          name: organizationEmployee.firstName +
                              " " +
                              organizationEmployee.lastName,
                          date: organizationEmployee.dateAdded,
                          type: organizationEmployee.type,
                        ),
                      ),
                    );
                  },
                  query: dbController.userCollection
                      .where("organization",
                          isEqualTo: organizationController
                              .selectedOrganizationModel.reference.id
                              .toString())
                      .orderBy("date", descending: true),
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

Widget employeeCard({
  name = "...",
  type = "...",
  date = "...",
}) {
  return Container(
    height: 50,
    constraints: const BoxConstraints(
      maxWidth: 600,
      minWidth: 300,
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
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: customText(
            text: name,
            textColor: purpleDark,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customText(
            text: type,
            textColor: purpleDark,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: customText(
            text: date,
            textColor: purpleDark,
          ),
        ),
      ],
    ),
  );
}
