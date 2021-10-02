import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';
import 'package:telus_partner_non_responsive/models/user_data_model.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget requestListCard() {
  DbController dbController = Get.put(DbController());
  return GetBuilder<UserDataController>(
      init: UserDataController(),
      builder: (userDataController) {
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
                        text: "All Requests",
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
                              text: "Name",
                              headingColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: customHeading(
                              text: "Type",
                              headingColor: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 75,
                            child: customHeading(
                              text: "Email",
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
                                  UserDataModel userDataModel =
                                      UserDataModel.fromDocumentSnapshot(
                                          documentSnapshot);
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        userDataController.selectedUserModel =
                                            userDataModel;
                                        UserDataController.firstNameController.text =
                                            userDataController
                                                .selectedUserModel.firstName;
                                        UserDataController.lastNameController.text =
                                            userDataController
                                                .selectedUserModel.lastName;
                                        UserDataController.emailController.text =
                                            userDataController
                                                .selectedUserModel.email;
                                        UserDataController.passwordController.text =
                                            userDataController
                                                .selectedUserModel.password;
                                        userDataController.selectedUserType =
                                            userDataController.selectedUserModel.type;
                                        userDataController.update();
                                      },
                                      child: employee(
                                        name: userDataModel.firstName +
                                            " " +
                                            userDataModel.lastName,
                                        dateAdded: userDataModel.dateAdded,
                                        type: userDataModel.type.toString(),
                                        email: userDataModel.email.toString(),
                                      ),
                                    ),
                                  );
                                },
                                query: dbController.userCollection
                                    .where("isAllowed", isEqualTo: false),
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

Widget employee({
  name = "...",
  type = "...",
  email = "...",
  dateAdded = "...",
}) {
  UserDataController userDataController = Get.put(UserDataController());
  return Column(
    children: [
      Container(
        color: email ==
                userDataController.selectedUserModel.email
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
                  textColor: email !=
                          userDataController.selectedUserModel.email
                      ? Colors.black
                      : white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 75,
                child: customText(
                  text: type,
                  textColor: email !=
                          userDataController.selectedUserModel.email
                      ? Colors.grey
                      : white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 75,
                child: customText(
                  text: email,
                  textColor: email !=
                          userDataController.selectedUserModel.email
                      ? Colors.grey
                      : white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 100,
                child: customText(
                  text: dateAdded,
                  textColor: email !=
                          userDataController.selectedUserModel.email
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
