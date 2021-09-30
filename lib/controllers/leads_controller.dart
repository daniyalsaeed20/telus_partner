import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:telus_partner_non_responsive/models/leads/leads_model.dart';

class LeadsController extends GetxController {
/* -------------------------------------------------------------------------- */
/*                                  Variables                                 */
/* -------------------------------------------------------------------------- */

  final suibmitLeadsFormKey = GlobalKey<FormState>();

  String time;
  String date;
  PortingInfoModel portingInfoModel = PortingInfoModel();

  /* -------------------------- Leads text controller ------------------------- */

  TextEditingController partnerCompanyNameController = TextEditingController();
  TextEditingController representativeNameController = TextEditingController();
  TextEditingController representativePhoneNumberController =
      TextEditingController();
  TextEditingController customerInterestOpportunityController =
      TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerContactPhoneNumberController =
      TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerCityController = TextEditingController();

  TextEditingController customerProvinceController = TextEditingController();
  TextEditingController customerPostalCodeController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerDateOfBirthController = TextEditingController();
  TextEditingController customerBusinessHSTController = TextEditingController();
  TextEditingController customerPersonalInformationController =
      TextEditingController();
      TextEditingController customerPersonalInformationFirstController =
      TextEditingController();
      TextEditingController customerPersonalInformationSecondController =
      TextEditingController();
  TextEditingController customerPackageDetailsController =
      TextEditingController();

  /* -------------------- porting request info conctrollers ------------------- */

  List<TextEditingController> portingRequestNameController = [];
  List<TextEditingController> portingRequestPhoneNumberController = [];
  List<TextEditingController> portingRequestCurrentServiceProviderController =
      [];
  List<TextEditingController> portingRequestAccountNumberController = [];
  List<TextEditingController> portingRequestDeviceNameController = [];
  List<TextEditingController> portingRequestAdditionalInfoController = [];
  List<TextEditingController> portingRequestCommunicateWithController = [];

  /* -------------------------------- Others -------------------------------- */

  Leads lead = Leads();

  int approvedLeads;
  int pendingLeads;
  int canceledLeads;

  int organizationApprovedLeads;
  int organizationPendingLeads;
  int organizationCanceledLeads;
  int portingInfoCount = 0;
/* -------------------------------------------------------------------------- */
/*                                    Lists                                   */
/* -------------------------------------------------------------------------- */

  List employeeLeads = [];
  List selectedEmployeeLeads = [];
  List organizationLeads = [];
  List<PortingInfoModel> portingInfoList = [];

/* -------------------------------------------------------------------------- */
/*                                  Functions                                 */
/* -------------------------------------------------------------------------- */

  addPortingRequesstFields() {
    portingRequestNameController.add(TextEditingController(text: ""));
    portingRequestPhoneNumberController.add(TextEditingController(text: ""));
    portingRequestCurrentServiceProviderController
        .add(TextEditingController(text: ""));
    portingRequestAccountNumberController.add(TextEditingController(text: ""));
    portingRequestAdditionalInfoController.add(TextEditingController(text: ""));
    portingRequestCommunicateWithController
        .add(TextEditingController(text: ""));
    portingRequestDeviceNameController.add(TextEditingController(text: ""));
  }

  clearFields() {
    customerAddressController.text = "";
    customerNameController.text = "";
    customerAddressController.text = "";
    customerBusinessHSTController.text = "";
    customerCityController.text = "";
    customerContactPhoneNumberController.text = "";
    customerDateOfBirthController.text = "";
    customerInterestOpportunityController.text = "";
    customerPackageDetailsController.text = "";
    customerPersonalInformationController.text = "";
    customerPostalCodeController.text = "";
    customerProvinceController.text = "";
    partnerCompanyNameController.text = "";
    representativeNameController.text = "";
    representativePhoneNumberController.text = "";
    customerEmailController.text = "";
    portingRequestNameController = [];
    portingRequestPhoneNumberController = [];
    portingRequestCurrentServiceProviderController = [];
    portingRequestAccountNumberController = [];
    portingRequestDeviceNameController = [];
    portingRequestAdditionalInfoController = [];
    portingRequestCommunicateWithController = [];
    update();
  }

  getDateTime() {
    date = DateFormat("dd/MM/yyyy").format(DateTime.now());
    time = DateFormat("HH:mm:ss").format(DateTime.now());
  }
}
