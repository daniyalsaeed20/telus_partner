import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/views/widgets/link_button.dart';

Widget landingButtons() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 704,
      right: 704,
      bottom: 128,
      top: 256,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        linkButton(
          fontWeight: FontWeight.bold,
          text: "About Us",
          textColor: textonlyReadColor,
          hasShadow: false,
          function: () {},
        ),
        linkButton(
          fontWeight: FontWeight.bold,
          text: "Our Team",
          textColor: textonlyReadColor,
          hasShadow: false,
          function: () {},
        ),
        linkButton(
          fontWeight: FontWeight.bold,
          text: "Contact Us",
          textColor: textonlyReadColor,
          hasShadow: false,
          function: () {},
        ),
      ],
    ),
  );
}
