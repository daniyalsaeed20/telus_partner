import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/constants/helper_functions.dart';
import 'package:telus_partner_non_responsive/controllers/app_controller.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';
import 'package:telus_partner_non_responsive/views/widgets/link_button.dart';

Widget loginCard() {
  UserDataController userDataController = Get.put(UserDataController());
  return GetBuilder<AppController>(
    init: AppController(),
    builder: (appController) {
      return Container(
        constraints: const BoxConstraints(
          maxWidth: 500,
          maxHeight: 900,
          minWidth: 300,
          minHeight: 500,
        ),
        decoration: BoxDecoration(
          color: cardBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
              offset: const Offset(0, 40),
            ),
          ],
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            32,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/logo_big.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      customHeading(
                        text: appController.isSignUpPressed == false
                            ? "LOGIN"
                            : "SIGNUP",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                appController.isSignUpPressed == false
                    ? Form(
                        key: userDataController.loginFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.loginEmailController,
                                isExpanded: true,
                                label: "Email",
                                validator: emailValidator,
                                textColor: textDisabledColor,
                                // initialValue: "daniyal.saeed7829@gmail.com"
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.loginPasswordController,
                                isExpanded: true,
                                label: "Password",
                                validator: passwordValidator,
                                textColor: textDisabledColor,
                                // initialValue: "daniyal1997"
                              ),
                            ),
                          ],
                        ),
                      )
                    : Form(
                        key: userDataController.signUpFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.firstNameController,
                                isExpanded: true,
                                label: "First Name",
                                validator: firstNameValidator,
                                textColor: textDisabledColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.lastNameController,
                                isExpanded: true,
                                label: "Last Name",
                                validator: lastNameValidator,
                                textColor: textDisabledColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.emailController,
                                isExpanded: true,
                                label: "Email",
                                validator: emailValidator,
                                textColor: textDisabledColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.passwordController,
                                isExpanded: true,
                                label: "Password",
                                validator: passwordValidator,
                                textColor: textDisabledColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                
                                controller:
                                    UserDataController.agencyController,
                                isExpanded: true,
                                label: "Organization",
                                validator: organizationValidator,
                                textColor: textDisabledColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  customHeading(
                                    text: "Select User Type",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                userTypeButton(text: "Admin"),
                                userTypeButton(text: "Manager"),
                                userTypeButton(text: "Employee"),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: customInputTextfield(
                                controller:
                                    UserDataController.userTypeController,
                                isExpanded: true,
                                label: "Manager/Employee(Agent)",
                                validator: userTypeValidator,
                                textColor: textDisabledColor,
                                enabled: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (AppController.checkboxIcon == Icons.check_box) {
                          AppController.checkboxIcon =
                              Icons.check_box_outline_blank;
                        } else if (AppController.checkboxIcon ==
                            Icons.check_box_outline_blank) {
                          AppController.checkboxIcon = Icons.check_box;
                        }
                        appController.update();
                      },
                      icon: Icon(
                        AppController.checkboxIcon,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          text: appController.isSignUpPressed == false
                              ? "Keep me logged in"
                              : "I agree to the ",
                          textColor: textonlyReadColor,
                        ),
                        appController.isSignUpPressed == true
                            ? linkButton(
                                fontWeight: FontWeight.bold,
                                text: "Terms and Conditions",
                                textColor: textinteractableColor,
                                hasShadow: false,
                                function: () {
                                  appController.isSignUpPressed =
                                      !appController.isSignUpPressed;
                                  appController.update();
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customButton(
                    text: appController.isSignUpPressed == false
                        ? "SIGN IN"
                        : "SIGN UP",
                    fontSize: 16,
                    textColor: Colors.white,
                    buttonColor: buttonColor,
                    function: () {
                      DbController dbController = Get.put(DbController());

                      if (appController.isSignUpPressed == false) {
                        dbController.login();
                      } else if (appController.isSignUpPressed != false) {
                        dbController.signUp();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: appController.isSignUpPressed == false
                            ? "Dont have an account?  "
                            : "Already have an account?  ",
                        textColor: textonlyReadColor,
                      ),
                      linkButton(
                        fontWeight: FontWeight.bold,
                        text: appController.isSignUpPressed == false
                            ? "Sign Up"
                            : "Login",
                        textColor: textinteractableColor,
                        hasShadow: false,
                        function: () {
                          appController.isSignUpPressed =
                              !appController.isSignUpPressed;
                          appController.update();
                        },
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
  );
}

Widget userTypeButton({
  text = "...",
  textColor = Colors.white,
  buttonColor = backgroundColor,
  fontSize = 16.0,
  fontWeight = FontWeight.bold,
  width = 100,
  height = 50,
  function,
}) {
  AppController appController = Get.put(AppController());
  return InkWell(
    onTap: () {
      UserDataController.userTypeController.text = text;
      appController.selectedUserType = text;
      appController.update();
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appController.selectedUserType != text
              ? [buttonColor, Colors.grey.withOpacity(0.9)]
              : [const Color(0xFF3A416F), Colors.black.withOpacity(0.9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: buttonColor,
      ),
      height: height,
      width: 100,
      child: Center(
        child: customText(
          text: text,
          textColor:
              appController.selectedUserType != text ? Colors.black : textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}
