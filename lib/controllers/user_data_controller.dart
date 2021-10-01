// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/models/user_data_model.dart';
import 'package:intl/intl.dart';

class UserDataController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /* ---------------------------------- lOGIN --------------------------------- */

  static TextEditingController loginEmailController = TextEditingController();
  static TextEditingController loginPasswordController =
      TextEditingController();

  /* --------------------------------- SIGNUP --------------------------------- */

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController agencyController = TextEditingController();
  static TextEditingController userTypeController = TextEditingController();

  UserDataModel userDataModel = UserDataModel();
  UserDataModel selectedEmployee = UserDataModel();

  bool userExists = false;
  static int selectedTab = 0;

  String date;

  /* -------------------------------------------------------------------------- */
  /*                                    List                                    */
  /* -------------------------------------------------------------------------- */

  List<UserDataModel> usersList = [];
  List employeeList = [];

  /* -------------------------------------------------------------------------- */
  /*                                  Functions                                 */
  /* -------------------------------------------------------------------------- */

  static void clearFields() {
    loginEmailController.text = "";
    loginPasswordController.text = "";

    firstNameController.text = "";
    lastNameController.text = "";
    emailController.text = "";
    passwordController.text = "";
  }

  getDateTime() {
    date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  }
}
