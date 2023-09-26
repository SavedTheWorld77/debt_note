// To parse this JSON data, do
//
//     final debt = debtFromJson(jsonString);

import 'dart:convert';

Debt debtFromJson(String str) => Debt.fromJson(json.decode(str));

String debtToJson(Debt data) => json.encode(data.toJson());

class Debt {
  String description;
  String name;
  List<PaymentDate> paymentDates;
  bool status;
  String uid;
  String debtId;

  Debt({
    required this.description,
    required this.name,
    required this.paymentDates,
    required this.status,
    required this.uid,
    required this.debtId,
  });

  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
        description: json["description"],
        name: json["name"],
        paymentDates: List<PaymentDate>.from(
            json["payment_dates"].map((x) => PaymentDate.fromJson(x))),
        status: json["status"],
        uid: json["uid"],
        debtId: json["debt_id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "payment_dates":
            List<dynamic>.from(paymentDates.map((x) => x.toJson())),
        "status": status,
        "uid": uid,
        "debt_id": debtId,
      };
}

class PaymentDate {
  int amount;
  String date;
  bool isPaid;

  PaymentDate({
    required this.amount,
    required this.date,
    required this.isPaid,
  });

  factory PaymentDate.fromJson(Map<String, dynamic> json) => PaymentDate(
        amount: json["amount"],
        date: json["date"],
        isPaid: json["is_paid"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "date": date,
        "is_paid": isPaid,
      };
}
