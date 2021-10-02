import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/controllers/db_controller.dart';
import 'package:telus_partner_non_responsive/controllers/user_data_controller.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';

class OrganizationController extends GetxController {
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  static GlobalKey organizationFormKey = GlobalKey<FormState>();

  OrganizationModel selectedOrganizationModel = OrganizationModel();
  OrganizationModel organizationModel = OrganizationModel();

  static TextEditingController organizationNameController =
      TextEditingController();
  static TextEditingController organizationAddressController =
      TextEditingController();
  static TextEditingController organizationEmployeesController =
      TextEditingController();

  int organizationApprovedLeads = 0;
  int organizationPendingLeads = 0;
  int organizationCanceledLeads = 0;
  List<Leads> organizationLeads = [];

  /* -------------------------------------------------------------------------- */
  /*                                    Lists                                   */
  /* -------------------------------------------------------------------------- */

  static List<String> organisationNames = [
    "Organizations 1",
    "Organizations 2",
    "Organizations 3",
    "Organizations 4",
    "Organizations 5",
    "Organizations 6",
    "Organizations 7",
    "Organizations 8",
    "Organizations 9",
    "Organizations 10",
    "Organizations 11",
    "Organizations 12",
    "Organizations 13",
    "Organizations 14",
    "Organizations 15",
    "Organizations 16",
    "Organizations 17",
    "Organizations 18",
  ];

  /* -------------------------------------------------------------------------- */
  /*                                  functions                                 */
  /* -------------------------------------------------------------------------- */

  getOrganizationLeads() {
    DbController dbController = Get.put(DbController());
    organizationLeads = [];
    dbController.getOrgLeads();
  }

  clearFields() {
    organizationNameController.clear();
    organizationAddressController.clear();
    organizationEmployeesController.clear();
    update();
  }

  addOrganization() {
    UserDataController userDataController = Get.put(UserDataController());
    DbController dbController = Get.put(DbController());
    userDataController.getDateTime();
    organizationModel = OrganizationModel(
      dateAdded: userDataController.date,
      leads: "0",
      name: organizationNameController.text,
      totalEmployees: 0,
      totalManagers: 0,
    );
    dbController.saveOrganization(organizationModel);
  }
}
