import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/organization_controller.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget organizationSummaryCard() {
  DbController dbController = Get.put(DbController());
  return GetBuilder<OrganizationController>(
      init: OrganizationController(),
      builder: (organizationController) {
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customHeading(
                        text: "Organization Summary",
                        fontSize: 20,
                        headingColor: Colors.grey,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 50,
                          width: 200,
                          child: Center(
                            child: customText(
                              text: "> View All Leads",
                              textColor: Colors.grey[400],
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if(organizationController.selectedOrganizationModel.reference != null)
                SizedBox(
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 62,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            lead(
                              color: green,
                              name: "Approved",
                              total: organizationController
                                  .organizationApprovedLeads.toString(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            lead(
                              color: orange,
                              name: "Pending",
                              total: organizationController
                                  .organizationPendingLeads.toString(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            lead(
                              color: red,
                              name: "Canceled",
                              total: organizationController
                                  .organizationCanceledLeads.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget lead({
  name = "...",
  total = "0",
  color = Colors.grey,
}) {
  return Container(
    width: 300,
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
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: customHeading(
              text: name,
              headingColor: Colors.grey,
            ),
          ),
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 0.1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
                child: customText(
                  text: total,
                  fontSize: 24,
                  textColor: backgroundColor,
                ),
              )),
        ],
      ),
    ),
  );
}
