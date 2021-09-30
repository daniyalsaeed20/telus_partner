  
import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget linkButton({
  text = "...",
  fontSize = 16.0,
  textColor = Colors.black,
  fontWeight = FontWeight.normal,
  function,
  hasShadow = false,
}) {
  return InkWell(
    onTap: function,
    child: Container(
      child: customText(
        hasShadow: hasShadow,
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textColor: textColor,
      ),
    ),
  );
}