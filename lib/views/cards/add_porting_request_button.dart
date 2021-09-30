import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';

Widget addPortingReuestButton({
  function,
}) {
  return InkWell(
    onTap: function,
    child: Container(
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customHeading(text: "Add porting request"),
            Icon(
              Icons.add_circle_outline,
              color: purple,
              size: 85,
            ),
          ],
        ),
      ),
    ),
  );
}
