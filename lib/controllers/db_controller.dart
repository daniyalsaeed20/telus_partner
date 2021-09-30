// ignore_for_file: avoid_function_literals_in_foreach_calls


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/constants/colors.dart';
import 'package:telus_partner_non_responsive/controllers/leads_controller.dart';
import 'package:telus_partner_non_responsive/controllers/loading_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';
import 'package:telus_partner_non_responsive/models/user_data_model.dart';
import 'package:telus_partner_non_responsive/views/Admin/admin_home_page.dart';
import 'package:telus_partner_non_responsive/views/Employee/employee_home_page.dart';
import 'package:telus_partner_non_responsive/views/Manager/manager_home_page.dart';

class DbController extends GetxController {
/* -------------------------------------------------------------------------- */
/*                                  Variables                                 */
/* -------------------------------------------------------------------------- */

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference leadsCollection =
      FirebaseFirestore.instance.collection('leads');
  CollectionReference organizationCollection =
      FirebaseFirestore.instance.collection('organizations');

  BuildContext context;

  final signUpKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();

  User firebaseUser;
  final db = FirebaseFirestore.instance;

/* -------------------------------------------------------------------------- */
/*                                    Lists                                   */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                                 Functioncs                                 */
/* -------------------------------------------------------------------------- */

/* ---------------------------------- Login --------------------------------- */

  login() {
    final LoadingController loadingController = Get.put(
      LoadingController(),
    );
    UserDataController userDataController = Get.put(
      UserDataController(),
    );
    if (userDataController.loginFormKey.currentState.validate()) {
      loadingController.start();
      for (UserDataModel user in userDataController.usersList) {
        if (user.email == UserDataController.loginEmailController.text) {
          userDataController.userExists = true;
          if (user.password ==
              UserDataController.loginPasswordController.text) {
            if (user.isAllowed) {
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(user.reference.id)
                  .snapshots()
                  .listen((doc) {
                userDataController.userDataModel =
                    UserDataModel.fromDocumentSnapshot(doc);
                userDataController.update();
              });
              goToDashboard(user.type);
            } else {
              Get.snackbar(
                'Login Failed!',
                'The Email has not been authorized for access yet.',
                backgroundColor: Colors.black,
                colorText: white,
                duration: const Duration(seconds: 7),
              );
            }
            break;
          } else {
            Get.snackbar(
              'Login Failed!',
              'Password is incorrect. Please check the details are correct.',
              backgroundColor: Colors.black,
              colorText: white,
              duration: const Duration(seconds: 7),
            );
            break;
          }
        }
      }
      if (userDataController.userExists == false) {
        Get.snackbar(
          'Login Failed!',
          'Email doesnt exist.',
          backgroundColor: Colors.black,
          colorText: white,
          duration: const Duration(seconds: 7),
        );
      }
      userDataController.userExists = false;
      loadingController.stop();
    }
    // loadingController.stop();
  }

  /* --------------------------------- signUp --------------------------------- */

  signUp() {
    final UserDataController userDataController = Get.put(
      UserDataController(),
    );
    userDataController.getDateTime();
    if (userDataController.signUpFormKey.currentState.validate()) {
      UserDataModel newUser = UserDataModel(
        email: UserDataController.emailController.text,
        firstName: UserDataController.firstNameController.text,
        isAllowed: false,
        lastName: UserDataController.lastNameController.text,
        leadIds: 0,
        dateAdded: userDataController.date,
        organization: UserDataController.agencyController.text,
        type: UserDataController.userTypeController.text,
        password: UserDataController.passwordController.text,
      );
      userCollection.add(newUser.toMap());
      Get.snackbar(
        'Success.',
        'Sign Up Successful',
        backgroundColor: Colors.black,
        colorText: white,
        duration: const Duration(seconds: 7),
      );
    }
  }

  /* ------------------------------ Get user DATA ----------------------------- */

  getUsersList() async {
    UserDataController userDataController = Get.put(
      UserDataController(),
    );
    await userCollection.get().then(
          (snapshot) => snapshot.docs.forEach(
            (doc) {
              userDataController.usersList
                  .add(UserDataModel.fromDocumentSnapshot(doc));
            },
          ),
        );
    userDataController.update();
  }

  goToDashboard(String userType) {
    if(userType == "Admin"){
     Get.to(()=> AdminHomePage());
    }
    if (userType == "Manager") {
      Get.to(() => ManagerHomePage());
    }
    if (userType == "Employee") {
      getEmployeeLeads();
      Get.to(() => EmployeeHomePage());
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                    leads                                   */
  /* -------------------------------------------------------------------------- */

  submitLeads() {
    LeadsController leadsController = Get.put(LeadsController());
    UserDataController userDataController = Get.put(UserDataController());
    if (leadsController.suibmitLeadsFormKey.currentState.validate()) {
      leadsController.getDateTime();
      for (int i = 0; i < leadsController.portingInfoCount; i++) {
        leadsController.portingInfoList.add(
          PortingInfoModel(
            accountNumber:
                leadsController.portingRequestAccountNumberController[i].text,
            additionalInformation:
                leadsController.portingRequestAdditionalInfoController[i].text,
            communicateWith:
                leadsController.portingRequestCommunicateWithController[i].text,
            currentServiceProvider: leadsController
                .portingRequestCurrentServiceProviderController[i].text,
            name: leadsController.portingRequestNameController[i].text,
            newMobileDeviceName:
                leadsController.portingRequestDeviceNameController[i].text,
            phoneNumber:
                leadsController.portingRequestPhoneNumberController[i].text,
          ),
        );
      }
      leadsController.lead = Leads(
        customerEmail: leadsController.customerAddressController.text,
        customerName: leadsController.customerNameController.text,
        employeeId: userDataController.userDataModel.reference.id,
        date: leadsController.date,
        time: leadsController.time,
        status: "Pending",
        organizationId: userDataController.userDataModel.organization,
        customerAddress: leadsController.customerAddressController.text,
        customerBusinessHST: leadsController.customerBusinessHSTController.text,
        customerCity: leadsController.customerCityController.text,
        customerContactPhoneNumber:
            leadsController.customerContactPhoneNumberController.text,
        customerDateOfBirth: leadsController.customerDateOfBirthController.text,
        customerInterestOpportunity:
            leadsController.customerInterestOpportunityController.text,
        customerPackageDetails:
            leadsController.customerPackageDetailsController.text,
        customerPersonalInformation: leadsController
                    .customerPersonalInformationController.text !=
                "Social Insurance"
            ? leadsController.customerPersonalInformationController.text +
                " # " +
                leadsController
                    .customerPersonalInformationFirstController.text +
                " Date: " +
                leadsController.customerPersonalInformationSecondController.text
            : leadsController.customerPersonalInformationController.text +
                " # " +
                leadsController.customerPersonalInformationFirstController.text,
        customerPostalCode: leadsController.customerPostalCodeController.text,
        customerProvince: leadsController.customerProvinceController.text,
        partnerCompanyName: leadsController.partnerCompanyNameController.text,
        representativeName: leadsController.representativeNameController.text,
        representativePhoneNumber:
            leadsController.representativePhoneNumberController.text,
        portingRequests: leadsController.portingInfoList,
      );
      leadsCollection.add(leadsController.lead.toMap());
      userDataController.userDataModel.leadIds =
          userDataController.userDataModel.leadIds + 1;
      userCollection
          .doc(userDataController.userDataModel.reference.id)
          .update(userDataController.userDataModel.toMapForLeads());

      Get.snackbar(
        'Success',
        'Lead Submitted Successfully.',
        backgroundColor: Colors.black,
        colorText: white,
        duration: const Duration(seconds: 7),
      );
      leadsController.clearFields();
    }
  }

  getEmployeeLeads() async {
    LeadsController leadsController = Get.put(LeadsController());
    UserDataController userDataController = Get.put(UserDataController());
    leadsController.employeeLeads.clear();
    leadsController.pendingLeads = 0;
    leadsController.approvedLeads = 0;
    leadsController.canceledLeads = 0;

    var snapShots = await leadsCollection
        .where("employeeId",
            isEqualTo: userDataController.userDataModel.reference.id)
        .get();
    if (snapShots.size > 0) {
      snapShots.docs.forEach(
        (doc) {
          if (doc["status"] == "Pending") {
            leadsController.pendingLeads = leadsController.pendingLeads + 1;
          } else if (doc["status"] == "Approved") {
            leadsController.approvedLeads = leadsController.approvedLeads + 1;
          } else if (doc["status"] == "Canceled") {
            leadsController.canceledLeads = leadsController.canceledLeads + 1;
          }
          leadsController.employeeLeads.add(doc);
        },
      );
    }
    leadsController.update();
  }

  getselectedEmployeeLeads(int id) async {
    LeadsController leadsController = Get.put(LeadsController());
    leadsController.selectedEmployeeLeads.clear();

    var snapShots =
        await leadsCollection.where("employeeId", isEqualTo: id).get();
    if (snapShots.size > 0) {
      snapShots.docs.forEach(
        (doc) {
          leadsController.selectedEmployeeLeads.add(doc);
        },
      );
    }
    leadsController.update();
  }

  getOrganizationLeads() async {
    LeadsController leadsController = Get.put(LeadsController());
    UserDataController userDataController = Get.put(UserDataController());
    leadsController.organizationLeads.clear();
    leadsController.organizationPendingLeads = 0;
    leadsController.organizationApprovedLeads = 0;
    leadsController.organizationCanceledLeads = 0;
    var snapShots = await leadsCollection
        .where("organizationId",
            isEqualTo: userDataController.userDataModel.organization)
        .get();
    if (snapShots.size > 0) {
      snapShots.docs.forEach(
        (doc) {
          if (doc["status"] == "Pending") {
            leadsController.organizationPendingLeads = leadsController.organizationPendingLeads + 1;
          } else if (doc["status"] == "Approved") {
            leadsController.organizationApprovedLeads = leadsController.organizationApprovedLeads + 1;
          } else if (doc["status"] == "Canceled") {
            leadsController.organizationCanceledLeads = leadsController.organizationCanceledLeads + 1;
          }
          leadsController.organizationLeads.add(
            Leads.fromDocumentSnapshot(
              doc,
            ),
          );
        },
      );
    }
    leadsController.update();
  }

  addEmployee(UserDataModel userDataModel) {
    userCollection.add(userDataModel.toMap());
    Get.snackbar(
      'Success.',
      'User Added Successfully',
      backgroundColor: Colors.black,
      colorText: white,
      duration: const Duration(seconds: 7),
    );
  }

  getEmployeeList() async {
    LeadsController leadsController = Get.put(LeadsController());
    UserDataController userDataController = Get.put(UserDataController());
    leadsController.employeeLeads.clear();
    leadsController.pendingLeads = 0;
    leadsController.approvedLeads = 0;
    leadsController.canceledLeads = 0;

    var snapShots = await userCollection
        .where("organization",
            isEqualTo: userDataController.userDataModel.organization)
        .get();
    if (snapShots.size > 0) {
      snapShots.docs.forEach(
        (doc) {
          UserDataModel userModel = UserDataModel(
            email: doc["email"],
            firstName: doc["firstName"],
            isAllowed: doc["isAllowed"],
            lastName: doc["lastName"],
            leadIds: doc["leadIds"],
            organization: doc["organization"],
            password: doc["password"],
            reference: doc.reference,
            type: doc["type"],
          );
          userDataController.employeeList.add(userModel);
        },
      );
    }
    leadsController.update();
  }
}