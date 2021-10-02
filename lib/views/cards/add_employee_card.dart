import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/constants/helper_functions.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';

Widget addEmployeeCard({
  text = "Add User",
  function,
}) {
  return GetBuilder<UserDataController>(
    init: UserDataController(),
    builder: (userDataController) {
      return Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 32,
              ),
              child: customHeading(
                text: text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
                left: 32,
                right: 32,
              ),
              child: customInputTextfield(
                controller: UserDataController.firstNameController,
                label: "First Name",
                validator: firstNameValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
                left: 32,
                right: 32,
              ),
              child: customInputTextfield(
                controller: UserDataController.lastNameController,
                label: "Last Name",
                validator: lastNameValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
                left: 32,
                right: 32,
              ),
              child: customInputTextfield(
                controller: UserDataController.emailController,
                label: "Email",
                validator: emailValidator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32,
                left: 32,
                right: 32,
              ),
              child: customInputTextfield(
                controller: UserDataController.passwordController,
                label: "Password",
                validator: passwordValidator,
              ),
            ),
            if (userDataController.userDataModel.type == "Admin")
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(
                    text: "Employee",
                  ),
                  button(
                    text: "Manager",
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 32,
              ),
              child: SizedBox(
                width: 200,
                child: customButton(
                  buttonColor: purpleDark,
                  text: "Save",
                  textColor: white,
                  function: function,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget button({
  text = "...",
  textColor = Colors.white,
  buttonColor = backgroundColor,
  fontSize = 16.0,
  fontWeight = FontWeight.bold,
  width = 100,
  height = 50,
}) {
  UserDataController userDataController = Get.put(UserDataController());
  return InkWell(
    onTap: () {
      UserDataController.userTypeController.text = text;
      userDataController.selectedUserType = text;
      userDataController.update();
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: userDataController.selectedUserType != text
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
          textColor: userDataController.selectedUserType != text
              ? Colors.black
              : textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}
