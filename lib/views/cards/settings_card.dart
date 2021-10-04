import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/constants/helper_functions.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';

Widget settingsCard() {
  return GetBuilder<UserDataController>(
    init: UserDataController(),
    builder: (userDataController) {
      return Center(
        child: SizedBox(
          // height: Get.height,
          width: Get.width,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  height: 500,
                  width: 500,
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
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            customHeading(
                              text: "Change Email",
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      customText(
                        text: "Enter current Email",
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customInputTextfield(
                          controller: UserDataController.newEmail1Controller,
                          isExpanded: true,
                          label: "Email",
                          validator: emailValidator,
                          textColor: textDisabledColor,
                          // initialValue: "daniyal.saeed7829@gmail.com"
                        ),
                      ),
                      customText(
                        text: "Enter current Password",
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customInputTextfield(
                          controller: UserDataController.newPassword1Controller,
                          isExpanded: true,
                          label: "Password",
                          validator: passwordValidator,
                          textColor: textDisabledColor,
                          // initialValue: "daniyal1997"
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      customText(
                        text: "Enter new Email",
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customInputTextfield(
                          controller: UserDataController.newEmailController,
                          isExpanded: true,
                          label: "Email",
                          validator: emailValidator,
                          textColor: textDisabledColor,
                          // initialValue: "daniyal1997"
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: customButton(
                          text: "Save",
                          buttonColor: purpleDark,
                          textColor: white,
                          function: () {
                            DbController dbController = Get.put(DbController());
                            if ((userDataController.userDataModel.email ==
                                    UserDataController.newEmail1Controller.text) &&
                                (userDataController.userDataModel.password ==
                                    UserDataController
                                        .newPassword1Controller.text)) {
                              userDataController.userDataModel.email =
                                  UserDataController.newEmailController.text;
                              dbController.userCollection
                                  .doc(
                                      userDataController.userDataModel.reference.id)
                                  .update(userDataController.userDataModel.toMap());
                              UserDataController.newEmail1Controller.clear();
                              UserDataController.newPassword1Controller.clear();
                              UserDataController.newEmailController.clear();
                              userDataController.update();
                              Get.snackbar(
                                'SUCCESS',
                                'Email Changed',
                                backgroundColor: Colors.black,
                                colorText: white,
                                duration: const Duration(seconds: 7),
                              );
                            } else {
                              Get.snackbar(
                                'Failed',
                                'Email or password incorrect',
                                backgroundColor: Colors.black,
                                colorText: white,
                                duration: const Duration(seconds: 7),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  height: 500,
                  width: 500,
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
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            customHeading(
                              text: "Change Password",
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      customText(
                        text: "Enter current Email",
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customInputTextfield(
                          controller: UserDataController.newEmail2Controller,
                          isExpanded: true,
                          label: "Email",
                          validator: emailValidator,
                          textColor: textDisabledColor,
                          // initialValue: "daniyal.saeed7829@gmail.com"
                        ),
                      ),
                      customText(
                        text: "Enter current Password",
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customInputTextfield(
                          controller: UserDataController.newPassword2Controller,
                          isExpanded: true,
                          label: "Password",
                          validator: passwordValidator,
                          textColor: textDisabledColor,
                          // initialValue: "daniyal1997"
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      customText(
                        text: "Enter new Password",
                        fontWeight: FontWeight.bold,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customInputTextfield(
                          controller: UserDataController.newPasswordController,
                          isExpanded: true,
                          label: "Password",
                          validator: passwordValidator,
                          textColor: textDisabledColor,
                          // initialValue: "daniyal1997"
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: customButton(
                          text: "Save",
                          buttonColor: purpleDark,
                          textColor: white,
                          function: () {
                            DbController dbController = Get.put(DbController());
                            if ((userDataController.userDataModel.email ==
                                    UserDataController.newEmail2Controller.text) &&
                                (userDataController.userDataModel.password ==
                                    UserDataController
                                        .newPassword2Controller.text)) {
                              userDataController.userDataModel.password =
                                  UserDataController.newPasswordController.text;
                              dbController.userCollection
                                  .doc(
                                      userDataController.userDataModel.reference.id)
                                  .update(userDataController.userDataModel.toMap());
                              UserDataController.newEmail2Controller.clear();
                              UserDataController.newPassword2Controller.clear();
                              UserDataController.newPasswordController.clear();
                              userDataController.update();
                              Get.snackbar(
                                'SUCCESS',
                                'Password Changed',
                                backgroundColor: Colors.black,
                                colorText: white,
                                duration: const Duration(seconds: 7),
                              );
                            } else {
                              Get.snackbar(
                                'Failed',
                                'Email or password incorrect',
                                backgroundColor: Colors.black,
                                colorText: white,
                                duration: const Duration(seconds: 7),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  );
}
