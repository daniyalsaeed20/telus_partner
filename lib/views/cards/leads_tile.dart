// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/views/cards/porting_request_details_card.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget leadTile({
  clientName = "...",
  clientEmail = "...",
  employeeEmail = "...",
  employeeName = "...",
  additionalInfo = "...",
  portingInfoModel,
  date = "17/11/2021",
  time = "04:12:33",
  color = const Color(0xFFAAAAAA),
  status = "status",
  partnerCompanyName = "...",
  representativeName = "...",
  representativePhoneNumber = "...",
  customerInterestOpportunity = "...",
  customerName = "...",
  customerContactPhoneNumber = "...",
  address = "...",
  city = "...",
  province = "...",
  postalCode = "...",
  email = "...",
  dob = "...",
  hst = "...",
  personalInfo = "...",
  packageDetails = "...",
}) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 16,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200,
              child: customHeading(
                text: clientName,
              ),
            ),
            SizedBox(
              width: 200,
              child: customText(
                text: date,
              ),
            ),
            SizedBox(
              width: 200,
              child: customText(
                text: time,
              ),
            ),
            SizedBox(
              width: 200,
              child: statusIcon(
                color: color,
                status: status,
              ),
            ),
            SizedBox(
              width: 200,
              child: statusIcon(
                color: Color(0xFFBDBDBD),
                status: "View Details",
              ),
            ),
            SizedBox(
              width: 200,
              child: InkWell(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 48,
                      ),
                      insetPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 48,
                      ),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      content: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 50,
                            runSpacing: 50,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: customHeading(
                                      text: "Lead Details",
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      headingColor: white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Divider(
                                  height: 1,
                                  color: greenLight,
                                ),
                              ),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 16.0,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                blurRadius: 5,
                                                spreadRadius: 0.1,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 16,
                                                  ),
                                                  child: customHeading(
                                                    text:
                                                        "Representative Information",
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Divider(
                                                    height: 1,
                                                    color: greenLight,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Partner Company Name"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  partnerCompanyName),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Representative Name"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  representativeName),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Representative Phone Number"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  representativePhoneNumber),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Customer Interest Opportunity"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  customerInterestOpportunity),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      /* -------------------------------------------------------------------------- */
                                      /*                                  Customer                                  */
                                      /* -------------------------------------------------------------------------- */
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          bottom: 16.0,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                blurRadius: 5,
                                                spreadRadius: 0.1,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 16,
                                                  ),
                                                  child: customHeading(
                                                    text:
                                                        "Customer Information",
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Divider(
                                                    height: 1,
                                                    color: greenLight,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text: "Name"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  customerName),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Contact Phone Number"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  customerContactPhoneNumber),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text: "Address"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: address),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text: "City"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: city),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text: "Province"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: province),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Postal Code"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: postalCode),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text: "Email"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: email),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Date of Birth"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: dob),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Business | HST"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text: hst),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 16,
                                                  ),
                                                  child: customHeading(
                                                    text:
                                                        "Personal Information",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: customText(
                                                            text: personalInfo),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customHeading(
                                                              text:
                                                                  "Package Details"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 400,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: customText(
                                                              text:
                                                                  packageDetails),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(
                                      //         mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //                 alignment: Alignment.centerLeft,
                                      //                 child: customHeading(
                                      //                     text: "Agent Name"),),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(text: employeeName),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Agent Email"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child:
                                      //                   customText(text: employeeEmail),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Client Name"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(text: clientName),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Agent Email"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(text: clientEmail),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Submit Date"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(text: date),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Submit Time"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(text: time),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Current Status"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(text: status),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Additional Info"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(
                                      //                 text: additionalInfo,
                                      //                 maxLines: 100,
                                      //                 align: TextAlign.left,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Additional Info"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(
                                      //                 text: additionalInfo,
                                      //                 maxLines: 100,
                                      //                 align: TextAlign.left,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Additional Info"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(
                                      //                 text: additionalInfo,
                                      //                 maxLines: 100,
                                      //                 align: TextAlign.left,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Additional Info"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(
                                      //                 text: additionalInfo,
                                      //                 maxLines: 100,
                                      //                 align: TextAlign.left,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Additional Info"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(
                                      //                 text: additionalInfo,
                                      //                 maxLines: 100,
                                      //                 align: TextAlign.left,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(8.0),
                                      //       child: Row(mainAxisSize: MainAxisSize.min,
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceBetween,
                                      //         children: [
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customHeading(
                                      //                   text: "Additional Info"),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             width: 400,
                                      //             child: Align(
                                      //               alignment: Alignment.centerLeft,
                                      //               child: customText(
                                      //                 text: additionalInfo,
                                      //                 maxLines: 100,
                                      //                 align: TextAlign.left,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: backgroundColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 0.1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: portingRequestDetailsCard(
                                      portingInfoModel)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xFF8392AB),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            height: 1,
            color: Colors.grey[300],
          ),
        ),
      ],
    ),
  );
}

Widget statusIcon({
  color = Colors.purple,
  status = "status",
}) {
  return Container(
    height: 50,
    width: 125,
    decoration: BoxDecoration(
      boxShadow: [
        status == "View Details"
            ? BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 0.1,
                offset: const Offset(0, 0),
              )
            : BoxShadow(
                color: Colors.transparent,
                blurRadius: 0,
                spreadRadius: 0,
                offset: const Offset(0, 0),
              ),
      ],
      borderRadius: BorderRadius.circular(15),
      // color: color,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: status == "Pending"
            ? ([
                orange.withOpacity(0.5),
                orange,
              ])
            : status == "Approved"
                ? ([
                    green.withOpacity(0.5),
                    green,
                  ])
                : status == "Canceled"
                    ? ([
                        red.withOpacity(0.5),
                        red,
                      ])
                    : ([
                        Color(0xFFBDBDBD),
                        Color(0xFFBDBDBD),
                      ]),
      ),
    ),
    child: Center(
      child: customText(
        text: status,
        textColor: white,
      ),
    ),
  );
}
