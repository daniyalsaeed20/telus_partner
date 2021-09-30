import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/leads_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget customerInterestOppertunityCard({
  text = "...",
  textColor = Colors.white,
  buttonColor = backgroundColor,
  fontSize = 16.0,
  fontWeight = FontWeight.bold,
  width = 200,
  height = 50,
  function,
}) {
  LeadsController leadsController = Get.put(LeadsController());
  return InkWell(
    onTap: () {
      leadsController.customerInterestOpportunityController.text = text;
      leadsController.update();
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: leadsController.customerInterestOpportunityController.text != text
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
      width: width,
      child: Center(
        child: customText(
          text: text,
          textColor:
              leadsController.customerInterestOpportunityController.text != text ? Colors.black : textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}