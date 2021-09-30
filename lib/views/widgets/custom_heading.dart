// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customHeading({
  text= '...',
  fontSize = 18.0,
  headingColor = Colors.black,
  fontWeight = FontWeight.bold,
  align = TextAlign.center,
  maxLines = 1,
}) {
  return Text(
    text,
    style: TextStyle(
      // ignore: prefer_const_literals_to_create_immutables
      shadows: [
        Shadow(
          color: Colors.black,
          blurRadius: 0,
          offset: Offset.zero,
        )
      ],
      color: headingColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontFamily: GoogleFonts.sora().fontFamily,
    ),
    textAlign: align,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}