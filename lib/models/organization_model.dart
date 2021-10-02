

import 'package:cloud_firestore/cloud_firestore.dart';

class OrganizationModel {
  OrganizationModel({
    this.name,
    this.totalManagers,
    this.dateAdded,
    this.leads,
    this.reference,
    this.totalEmployees,
  });

  String name;
  int totalManagers;
  String leads;
  int totalEmployees;
  String dateAdded;

  DocumentReference reference;

  factory OrganizationModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return OrganizationModel(
      name: doc["name"] ?? "N/A",
      totalManagers: doc["totalManagers"] ?? 0,
      dateAdded: doc["dateAdded"] ?? "N/A",
      leads: doc["leads"] ?? "N/A",
      totalEmployees: doc["totalEmployees"] ?? 0,
      reference: doc.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name ?? "N/A",
      "totalManagers": totalManagers ?? 0,
      "dateAdded": dateAdded ?? "N/A",
      "leads": leads ?? "N/A",
      "totalEmployees": totalEmployees ?? 0,
    };
  }

  Map<String, dynamic> toMapForLeads() {
    return {
      "leads": leads,
    };
  }

  Map<String, dynamic> toMapForEmployees() {
    return {
      "totalManagers": totalManagers,
      "totalEmployees": totalEmployees,
    };
  }
}
