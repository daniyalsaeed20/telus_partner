import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telus_partner_non_responsive/models/organization_model.dart';

class OrganizationController extends GetxController{
  /* -------------------------------------------------------------------------- */
  /*                                  Variables                                 */
  /* -------------------------------------------------------------------------- */

  static GlobalKey organizationFormKey = GlobalKey<FormState>();

  OrganizationModel organizationModel = OrganizationModel();

  
  static TextEditingController organizationNameController = TextEditingController();
  static TextEditingController organizationAddressController = TextEditingController();
  static TextEditingController organizationEmployeesController = TextEditingController();

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
}