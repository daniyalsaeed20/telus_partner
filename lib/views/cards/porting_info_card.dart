import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/constants/helper_functions.dart';
import 'package:telus_partner_non_responsive/controllers/leads_controller.dart';
import 'package:telus_partner_non_responsive/views/cards/add_porting_request_button.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text_field.dart';

Widget portingInfoCard(int index) {
  LeadsController leadsController = Get.put(LeadsController());
  return Padding(
    padding: const EdgeInsets.only(
      left: 16.0,
      right: 16.0,
      bottom: 16.0,
    ),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: index == leadsController.portingInfoCount - 1
                      ? const EdgeInsets.only(
                          left: 8,
                          top: 8,
                          bottom: 8,
                          right: 96,
                        )
                      : const EdgeInsets.all(8.0),
                  child: customInputTextfield(
                    validator: fieldValidator,
                    controller:
                        leadsController.portingRequestNameController[index],
                    label: "Name",
                  ),
                ),
                Padding(
                  padding: index == leadsController.portingInfoCount - 1
                      ? const EdgeInsets.only(
                          left: 8,
                          top: 8,
                          bottom: 8,
                          right: 96,
                        )
                      : const EdgeInsets.all(8.0),
                  child: customInputTextfield(
                    validator: fieldValidator,
                    controller: leadsController
                        .portingRequestPhoneNumberController[index],
                    label: "Phone Number",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customInputTextfield(
                    validator: fieldValidator,
                    controller: leadsController
                        .portingRequestCurrentServiceProviderController[index],
                    label: "Current Service Provider",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customInputTextfield(
                    validator: fieldValidator,
                    controller: leadsController
                        .portingRequestAccountNumberController[index],
                    label: "Account #",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customInputTextfield(
                    validator: fieldValidator,
                    controller: leadsController
                        .portingRequestDeviceNameController[index],
                    label:
                        "New Mobile Device Name & Details (If BYOD please specify)",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customInputTextfield(
                    validator: fieldValidator,
                    controller: leadsController
                        .portingRequestAdditionalInfoController[index],
                    label: "Additional Information",
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: customHeading(
                      text: "Communicate directly with",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    runSpacing: 25,
                    spacing: 25,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: button(
                          text: "Customer",
                          index: index,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: button(
                          text: "Partner",
                          index: index,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (index == leadsController.portingInfoCount - 1)
          removePortingReuestButton(
            function: () {
              leadsController.removePortingRequesstFields();
            },
          ),
      ],
    ),
  );
}

Widget button({
  text = "...",
  textColor = Colors.white,
  buttonColor = backgroundColor,
  fontSize = 16.0,
  fontWeight = FontWeight.bold,
  width = 200,
  height = 50,
  function,
  index,
}) {
  LeadsController leadsController = Get.put(LeadsController());
  return InkWell(
    onTap: () {
      leadsController.portingRequestCommunicateWithController[index].text =
          text;
      leadsController.update();
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: leadsController
                      .portingRequestCommunicateWithController[index].text !=
                  text
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
          textColor: leadsController
                      .portingRequestCommunicateWithController[index].text !=
                  text
              ? Colors.black
              : textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}
