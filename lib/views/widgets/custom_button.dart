// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget customButton({
  text = "...",
  textColor = Colors.white,
  buttonColor = buttonColor,
  fontSize = 16.0,
  fontWeight = FontWeight.bold,
  width = 300,
  height = 50,
  function,
}) {
  return InkWell(
    onTap: function,
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [buttonColor, Colors.black.withOpacity(0.9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 3,
              //     offset: Offset(0, 2),
              //   ),
              // ],
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: buttonColor,
            ),
            height: height,
            // width: GET.WIDTH,
            child: Center(
              child: customText(
                text: text,
                textColor: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
