import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';

customDivider({
  width = 100,
  height = 100,
  isVertical = true,
}) {
  return GlassmorphicContainer(
    border: 2,
    blur: 3,
    borderRadius: 5,
    linearGradient: isVertical ? LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [purple, green],
      stops: const [
        0.1,
        1,
      ],
    ) : LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [purple, green],
      stops: const [
        0.1,
        1,
      ],
    ),
    borderGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [purple, green],
    ),
    height: height,
    width: width,
  );
}
