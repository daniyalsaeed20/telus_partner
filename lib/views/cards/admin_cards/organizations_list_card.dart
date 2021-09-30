import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';

Widget organizationsListCard() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: customHeading(
            text: "Organizations",
            fontSize: 24,
          ),
        ),
        Container(
          height: 500,
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
              children: [
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: organizationsCard(),
                  ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget organizationsCard() {
  return Container(
    height: 50,
    constraints: const BoxConstraints(maxWidth: 600,  minWidth: 300),
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
  );
}
