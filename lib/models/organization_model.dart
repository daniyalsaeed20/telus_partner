

import 'package:cloud_firestore/cloud_firestore.dart';

class OrganizationModel {
  OrganizationModel({
    this.name,
    this.address,
    this.employeeIds,
    this.leadIds,
    this.leads,
    this.reference,
    this.totalEmployees,
  });

  String name;
  String address;
  String leads;
  String totalEmployees;
  List<String> leadIds;
  List<String> employeeIds;

  DocumentReference reference;

  factory OrganizationModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return OrganizationModel(
      name: doc["name"],
      address: doc["address"],
      employeeIds: doc["employeeIds"],
      leadIds: doc["leadIds"],
      leads: doc["leads"],
      totalEmployees: doc["totalEmployees"] ?? false,
      reference: doc.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "address": address,
      "leadIds": leadIds,
      "employeeIds": employeeIds,
      "leads": leads,
      "totalEmployees": totalEmployees ?? false,
    };
  }

  Map<String, dynamic> toMapForEmployees() {
    return {
      "employeeIds": employeeIds,
    };
  }

  Map<String, dynamic> toMapForLeads() {
    return {
      "leads": leads,
    };
  }
}
