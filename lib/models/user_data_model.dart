import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  UserDataModel({
    this.leadIds,
    this.email,
    this.firstName,
    this.lastName,
    this.organization,
    this.type,
    this.isAllowed,
    this.password,
    this.dateAdded,
    this.reference,
  });
  
  String firstName;
  String dateAdded;
  String lastName;
  String email;
  String password;
  int leadIds;
  String organization;
  String type;

  bool isAllowed;

  DocumentReference reference;

  factory UserDataModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserDataModel(
      firstName: doc["firstName"] ?? "N/A",
      dateAdded: doc["dateAdded"] ?? "N/A",
      password: doc["password"] ?? "N/A",
      lastName: doc["lastName"] ?? "N/A",
      email: doc["email"] ?? "N/A",
      organization: doc["organization"] ?? "N/A",
      leadIds: doc["leadIds"] ?? 0,
      type: doc["type"] ?? "N/A",
      isAllowed: doc["isAllowed"] ?? false,
      reference: doc.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName ?? "N/A",
      "dateAdded": dateAdded ?? "N/A",
      "lastName": lastName ?? "N/A",
      "password": password ?? "N/A",
      "email": email ?? "N/A",
      "leadIds": leadIds ?? [],
      "organization": organization ?? "N/A",
      "type": type ?? "N/A",
      "isAllowed": isAllowed ?? false,
    };
  }

  Map<String, dynamic> toMapForLeads() {
    return {
      "leadIds": leadIds ?? 0,
    };
  }
}
