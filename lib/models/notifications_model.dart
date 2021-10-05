import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  NotificationsModel({
    this.name,
    this.date,
    this.isLead,
    this.isSignUp,
    this.reference,
  });

  String name;
  String date;
  bool isLead;
  bool isSignUp;
  DocumentReference reference;

  factory NotificationsModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return NotificationsModel(
        name: doc["name"] ?? "N/A",
        date: doc["date"] ?? "N/A",
        isLead: doc["isLead"] ?? true,
        isSignUp: doc["isSignUp"] ?? false,
        reference: doc.reference);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name ?? "N/A",
      "date": date ?? "N/A",
      "isLead": isLead ?? true,
      "isSignUp": isSignUp ?? false,
    };
  }
}
