import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/constants/helper_functions.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';

Widget addOrganizationCard({
  text = "Add Organization",
  function,
}) {
  return GetBuilder<OrganizationController>(
    init: OrganizationController(),
    builder: (organizationController) {
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
                controller: OrganizationController.organizationNameController,
                label: "Name",
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
                controller: OrganizationController.organizationAddressController,
                label: "Password",
                validator: lastNameValidator,
              ),
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