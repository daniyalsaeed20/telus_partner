// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField({
  text = '...',
  controller,
  String Function(String) validator,
  keyboardType = TextInputType.text,
  obscureText = false,
}) {
  return Material(
    child: Container(
      height: 50,
      width: 700,
      decoration: BoxDecoration(
          // color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: silver,
          )),
      child: Center(
        child: TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          style: TextStyle(
            fontSize: 30,
            // color: white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            hintText: text,
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}

Widget customInputTextfield(
    {controller,
    textColor = textDisabledColor,
    isMultiTextField = false,
    isExpanded = false,
    onSave,
    enabled = true,
    // initialValue = "...",
    String Function(String) validator,
    suffixPressed,
    label = 'First',
    isPasswordField = false,
    isPasswordShow = false,
    suffixIcon,
    onChanged,
    keyBoardType = TextInputType.text}) {
  return TextFormField(
    // initialValue: initialValue,
    // focusNode: ,
    maxLines: isExpanded
        ? null
        : isMultiTextField
            ? 4
            : 1,
    controller: controller,
    onSaved: onSave,
    validator: validator,
    onChanged: onChanged,
    style: TextStyle(color: textinteractableColor),
    enabled: enabled,
    obscureText: isPasswordField ? !isPasswordShow : false,
    decoration: InputDecoration(
      // errorMaxLines: 3,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: textinteractableColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: textinteractableColor,
        ),
      ),
      isDense: true,
      focusColor: purpleDark,
      labelText: label,
      labelStyle: TextStyle(
        color: textColor,
      ),
      suffix: isPasswordField || suffixIcon != null
          ? InkWell(
              onTap: suffixPressed,
              child: Icon(
                !isPasswordField
                    ? suffixIcon
                    : !isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
              ),
            )
          : null,
    ),
  );
}
