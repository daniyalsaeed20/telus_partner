import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget organizationListCard({appController, name,}) {
  return Container(
    decoration: appController.selectedOrganisation == name
        ? BoxDecoration(
            gradient: LinearGradient(
          colors: appController.selectedUserType != name
              ? [buttonColor, Colors.grey.withOpacity(0.9)]
              : [const Color(0xFF3A416F), Colors.black.withOpacity(0.9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ))
        : null,
    child: ListTile(
      title: customText(
        text: name,
        textColor: appController.selectedOrganisation == name
            ? Colors.white
            : Colors.black,
      ),
      leading: Padding(
        padding: const EdgeInsets.all(
          8,
        ),
        child: Icon(
          Icons.business_outlined,
          color: appController.selectedOrganisation == name
              ? Colors.white
              : Colors.black,
        ),
      ),
      onTap: () {
        UserDataController.agencyController.text = name;
        appController.selectedOrganisation = name;
        appController.update();
        Get.back();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}