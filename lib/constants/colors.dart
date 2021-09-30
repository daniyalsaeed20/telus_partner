// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFFF2F2F2);
const Color cardBackground = Colors.white;
const Color textDisabledColor = Colors.grey;
const Color textonlyReadColor = Color(0xFF8392AB);
const Color textinteractableColor = Color(0Xff141414);
const Color buttonColor = Color(0xFF3A416F);

Color green = Color(0xFF36a334);
  Color greenDark = Color(0xFF257824);
  Color greenLight = Color(0xFF39c738);
  Color purple = Color(0xFF4b1769);
  Color purpleDark = Color(0xFF37114d);
  Color purpleLight = Color(0xFF37114d);
  Color silver = Color(0xFFf0f5f5);
  Color white = Color(0xFFfcffff);
  const Color orange = Color(0XFFec8d2f);
  const Color red = Color(0XFFf44336);

  MaterialColor convertToMaterialColor(var string) {
  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  MaterialColor colorCustom = MaterialColor(string, color);
  return colorCustom;
}