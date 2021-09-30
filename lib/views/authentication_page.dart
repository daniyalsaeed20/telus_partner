// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/app_controller.dart';
import 'package:telus_partner_non_responsive/controllers/loading_controller.dart';
import 'package:telus_partner_non_responsive/views/background/authentication_page_background.dart';
import 'package:telus_partner_non_responsive/views/cards/landing_buttons.dart';
import 'package:telus_partner_non_responsive/views/cards/login_card.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingController>(
        init: LoadingController(),
        builder: (loadingController) {
          return GetBuilder<AppController>(
              init: AppController(),
              builder: (appController) {
                return Scaffold(
                  backgroundColor: backgroundColor,
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height,
                              width: Get.width,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  authenticationPageBackground(),
                                  loginCard(),
                                ],
                              ),
                            ),
                            landingButtons(),
                          ],
                        ),
                      ),
                      loadingController.isLoadingActive.value == true
                          ? Container(
                              height: Get.height,
                              width: Get.width,
                              color: Colors.black.withOpacity(0.3),
                            )
                          : const SizedBox(),
                    ],
                  ),
                );
              });
        });
  }
}
