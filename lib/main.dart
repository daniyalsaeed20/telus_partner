// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/views/authentication_page.dart';
// import 'package:telus_partner_non_responsive/views/login_sign_up_page.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
      home: landingPage(context),
    );
  }
}

landingPage(BuildContext context) {
  DbController dbController = Get.put(DbController());
    dbController.getUsersList();
  return ScreenUtilInit(
      designSize: Size(1920, 1080), builder: () => AuthenticationPage());
      // designSize: Size(1920, 1080), builder: () => EmployeeHomePage());
}