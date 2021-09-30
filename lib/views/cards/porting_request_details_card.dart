import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget portingRequestDetailsCard(List portingInfoModel) {
  return Container(
    constraints: const BoxConstraints(maxWidth: 800, maxHeight: 310),
    child: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            for (int i = 0; i < portingInfoModel.length; i++)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: card(portingInfoModel[i]),
              )
          ],
        ),
      ),
    ),
  );
}

Widget card(var portingInfoModel) {
  return Container(
    // height: 200,
    // width: 300,
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Name"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["name"]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Phone Number"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["phoneNumber"]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Device Name"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["newMobileDeviceName"]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Current Service Provider"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["currentServiceProvider"]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Account Number"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["accountNumber"]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Additional Information"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["additionalInformation"]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customHeading(text: "Communicate With"),
                ),
              ),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: customText(text: portingInfoModel["communicateWith"]),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
