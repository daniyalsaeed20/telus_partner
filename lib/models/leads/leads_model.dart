import 'package:cloud_firestore/cloud_firestore.dart';

class Leads {
  Leads({
    this.reference,
    this.customerEmail,
    this.customerName,
    this.customerAddress,
    this.customerBusinessHST,
    this.customerCity,
    this.customerContactPhoneNumber,
    this.customerDateOfBirth,
    this.customerInterestOpportunity,
    this.customerPackageDetails,
    this.customerPersonalInformation,
    this.customerPostalCode,
    this.customerProvince,
    this.partnerCompanyName,
    this.representativeName,
    this.representativePhoneNumber,
    this.date,
    this.employeeId,
    this.organizationId,
    this.time,
    this.portingRequests,
    this.status,
  });

/* -------------------------------- Employee -------------------------------- */
  String partnerCompanyName;
  String representativeName;
  String representativePhoneNumber;

  /* -------------------------------- customer -------------------------------- */
  String customerInterestOpportunity;
  String customerName;
  String customerContactPhoneNumber;
  String customerAddress;
  String customerCity;
  String customerProvince;
  String customerPostalCode;
  String customerEmail;
  String customerDateOfBirth;
  String customerBusinessHST;
  String
      customerPersonalInformation; //Driving License - Canadian passport - Social Insurance
  String customerPackageDetails;

/* ---------------------------------- extra --------------------------------- */

  String employeeId;
  String organizationId;
  String date;
  String time;
  String status;

  /* ---------------------------- Porting requests ---------------------------- */

  List portingRequests;

  DocumentReference reference;

  factory Leads.fromDocumentSnapshot(DocumentSnapshot doc) {
    List portingRequests = doc['portingRequests'];
    List _portingRequests = [];
    if (portingRequests != null) {
      for (var portingInfo in portingRequests) {
        var data = PortingInfoModel.fromMap(portingInfo);
        _portingRequests.add(data);
      }
    }
    return Leads(
      partnerCompanyName: doc["partnerCompanyName"] ?? "N/A",
      representativeName: doc["representativeName"] ?? "N/A",
      representativePhoneNumber: doc["representativePhoneNumber"] ?? "N/A",
      customerInterestOpportunity: doc["customerInterestOpportunity"] ?? "N/A",
      customerEmail: doc["customerEmail"] ?? "N/A",
      customerName: doc["customerName"] ?? "N/A",
      customerContactPhoneNumber: doc["customerContactPhoneNumber"] ?? "N/A",
      employeeId: doc["employeeId"] ?? "N/A",
      organizationId: doc["organizationId"] ?? "N/A",
      date: doc["date"] ?? "N/A",
      time: doc["time"] ?? "N/A",
      status: doc["status"] ?? "N/A",
      customerAddress: doc["customerAddress"] ?? "N/A",
      customerCity: doc["customerCity"] ?? "N/A",
      customerProvince: doc["customerProvince"] ?? "N/A",
      customerPostalCode: doc["customerPostalCode"] ?? "N/A",
      customerDateOfBirth: doc["customerDateOfBirth"] ?? "N/A",
      customerBusinessHST: doc["customerBusinessHST"] ?? "N/A",
      customerPersonalInformation: doc["customerPersonalInformation"] ?? "N/A",
      customerPackageDetails: doc["customerPackageDetails"] ?? "N/A",
      portingRequests: doc["portingRequests"] ?? [],
      reference: doc.reference,
    );
  }

  Map<String, dynamic> toMap() {
    List _portingRequests = [];
    if (portingRequests != null) {
      for (var portingInfo in portingRequests) {
        _portingRequests.add(
          portingInfo.toMap(),
        );
      }
    }
    return {
      "partnerCompanyName": partnerCompanyName ?? "N/A",
      "representativeName": representativeName ?? "N/A",
      "customerInterestOpportunity": customerInterestOpportunity ?? "N/A",
      "representativePhoneNumber": representativePhoneNumber ?? "N/A",
      "customerEmail": customerEmail ?? "N/A",
      "customerName": customerName ?? "N/A",
      "customerContactPhoneNumber": customerContactPhoneNumber ?? "N/A",
      "employeeId": employeeId ?? "N/A",
      "organizationId": organizationId ?? "N/A",
      "date": date ?? "N/A",
      "time": time ?? "N/A",
      "status": status ?? "N/A",
      "customerAddress": customerAddress ?? "N/A",
      "customerCity": customerCity ?? "N/A",
      "customerProvince": customerProvince ?? "N/A",
      "customerPostalCode": customerPostalCode ?? "N/A",
      "customerDateOfBirth": customerDateOfBirth ?? "N/A",
      "customerBusinessHST": customerBusinessHST ?? "N/A",
      "customerPersonalInformation": customerPersonalInformation ?? "N/A",
      "customerPackageDetails": customerPackageDetails ?? "N/A",
      "portingRequests": _portingRequests ?? []
    };
  }
}

class PortingInfoModel {
  PortingInfoModel({
    this.name,
    this.phoneNumber,
    this.currentServiceProvider,
    this.accountNumber,
    this.newMobileDeviceName,
    this.additionalInformation,
    this.communicateWith,
  });

  String name;
  String phoneNumber;
  String currentServiceProvider;
  String accountNumber;
  String newMobileDeviceName;
  String additionalInformation;
  String communicateWith;

  factory PortingInfoModel.fromMap(map) {
    return PortingInfoModel(
      name: map["name"] ?? "N/A",
      phoneNumber: map["phoneNumber"] ?? "N/A",
      currentServiceProvider: map["currentServiceProvider"] ?? "N/A",
      accountNumber: map["accountNumber"] ?? "N/A",
      newMobileDeviceName: map["newMobileDeviceName"] ?? "N/A",
      additionalInformation: map["additionalInformation"] ?? "N/A",
      communicateWith: map["communicateWith"] ?? "N/A",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name ?? "N/A",
      "phoneNumber": phoneNumber ?? "N/A",
      "accountNumber": accountNumber ?? "N/A",
      "currentServiceProvider": currentServiceProvider ?? "N/A",
      "newMobileDeviceName": newMobileDeviceName ?? "N/A",
      "additionalInformation": additionalInformation ?? "N/A",
      "communicateWith": communicateWith ?? "N/A",
    };
  }
}