import 'package:collapsible_sidebar/collapsible_sidebar/collapsible_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  bool isSignUpPressed = false;
  static IconData checkboxIcon = Icons.check_box_outline_blank;

  static int drawerIndex = 0;

  RxBool isLoadingActive = false.obs;
  String selectedUserType = "";
  String selectedOrganisation = "";

  /* -------------------------------------------------------------------------- */
  /*                                    lIST                                    */
  /* -------------------------------------------------------------------------- */

  static List<String> adminDrawerItems = [
    "Organizations",
    "Privileges",
    "Notifications",
  ];

  static List adminDrawerItemsIcons = [
    Icons.business_outlined,
    Icons.settings_outlined,
    Icons.notifications_outlined,
  ];

  

  /* -------------------------------------------------------------------------- */
  /*                                    Admin                                   */
  /* -------------------------------------------------------------------------- */

  List<CollapsibleItem> items;
  String headline;
  static AssetImage avatarImg = const AssetImage('assets/default_profile.png');

  initialize() {
    items = generateItems;
    headline = items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () {
          headline = 'DashBoard';
          update();
          
        },
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.icecream,
        onPressed: () {
          headline = 'Errors';
          update();
        },
      ),
    ];
  }
}
