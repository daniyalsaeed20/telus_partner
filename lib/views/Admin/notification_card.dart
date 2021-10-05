import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';

Widget notificationCard(
  {
    date = "--/--/--",
    name = "Employee Name",
    isLead = true,
    isSignup = false,
  }
) {
  return Padding(
    padding: const EdgeInsets.only(left: 32,right:32, top: 32,),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 48,
              ),
              child: !isSignup ? customHeading(
                text: isLead ?"Lead submitted by $name" : "Request to add agent by $name",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ) : customHeading(
                text: "$name requested to sign up",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 48,
              ),
              child: customHeading(
                text: date,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                headingColor: Colors.grey[400],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            height: 1,
            color: Colors.grey[400],
          ),
        ),
      ],
    ),
  );
}
