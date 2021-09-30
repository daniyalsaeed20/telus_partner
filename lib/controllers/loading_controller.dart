import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telus_partner_non_responsive/controllers/app_controller.dart';

class LoadingController extends GetxController {
  start() {
    AppController appController = Get.put(
      AppController(),
    );
    appController.isLoadingActive.value = true;
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
    EasyLoading.instance.toastPosition = EasyLoadingToastPosition.center;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.maskType = EasyLoadingMaskType.none;
    EasyLoading.instance.indicatorColor = const Color(0xFF5B9313);
    EasyLoading.instance.backgroundColor = Colors.white.withOpacity(0);
    EasyLoading.instance.textColor = Colors.white.withOpacity(0);
    EasyLoading.instance.indicatorSize = 85.r;

    EasyLoading.show(
      dismissOnTap: false,
    );
  }

  stop() {
    EasyLoading.dismiss();
    AppController appController = Get.put(
      AppController(),
    );
    appController.isLoadingActive.value = false;
  }

  RxBool isLoadingActive = false.obs;
}