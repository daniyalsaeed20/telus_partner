import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_heading.dart';
import 'package:telus_partner_non_responsive/views/widgets/custom_text.dart';

Widget profileHomeCard() {
  return GetBuilder<UserDataController>(
    init: UserDataController(),
    builder: (userDataController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 300,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: InkWell(
                              onTap: () {
                                UserDataController.loginEmailController.text = "";
                                UserDataController.loginPasswordController.text = "";
                                Get.back();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  customText(
                                    text: "Sign Out  ",
                                    textColor: white,
                                  ),
                                  Icon(
                                    Icons.notifications_active,
                                    color: white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 250,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFF0080).withOpacity(0.5),
                        const Color(0xFF189DFF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 0.1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 0.1,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  // alignment: WrapAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minWidth: 200,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              "assets/default_profile.png",
                            ),
                          ),
                          Column(
                            children: [
                              customHeading(text: userDataController.userDataModel.firstName + " " + userDataController.userDataModel.lastName),
                              customText(text: userDataController.userDataModel.type,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InkWell(
                        onTap: () {
                          UserDataController.selectedTab = 2;
          userDataController.update();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: white,
                          ),
                          height: 50,
                          // width: GET.WIDTH,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Center(
                              child: customText(
                                text: "Settings",
                                textColor: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  );
}
