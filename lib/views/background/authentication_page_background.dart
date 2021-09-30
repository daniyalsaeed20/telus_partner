import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';

Widget authenticationPageBackground(){
  return Container(
        height: Get.height,
        width: Get.width,
        color: backgroundColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Get.height / 2,
                width: Get.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/bg_image.png",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}