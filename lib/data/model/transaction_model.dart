// To parse this JSON data, do
//
//     final transactionUser = transactionUserFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

TransactionUser? transactionUserFromJson(String str) =>
    TransactionUser.fromJson(json.decode(str));

String transactionUserToJson(TransactionUser? data) =>
    json.encode(data!.toJson());

class TransactionUser {
  TransactionUser({
    required this.createAt,
    required this.detail,
    required this.idCostumer,
    required this.nameCostumer,
  });

  final Timestamp? createAt;
  final Detail? detail;
  final String? idCostumer;
  final String? nameCostumer;

  factory TransactionUser.fromJson(Map<String, dynamic> json) =>
      TransactionUser(
        createAt: json["create_at"],
        detail: Detail.fromJson(json["detail"]),
        idCostumer: json["id_costumer"],
        nameCostumer: json["name_costumer"],
      );

  Map<String, dynamic> toJson() => {
        "create_at": createAt,
        "detail": detail!.toJson(),
        "id_costumer": idCostumer,
        "name_costumer": nameCostumer,
      };
}

class Detail {
  Detail({
    required this.item,
    required this.point,
    required this.total,
    required this.vendor,
    required this.payment,
  });

  final List<Item?>? item;
  final int? point;
  final int? total;
  final Vendor? vendor;
  final String? payment;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        item: json["item"] == null
            ? []
            : List<Item?>.from(json["item"]!.map((x) => Item.fromJson(x))),
        point: json["point"],
        total: json["total"],
        vendor: Vendor.fromJson(json["vendor"]),
        payment: json["payment"],
      );

  Map<String, dynamic> toJson() => {
        "item": item == null
            ? []
            : List<dynamic>.from(item!.map((x) => x!.toJson())),
        "point": point,
        "total": total,
        "vendor": vendor!.toJson(),
        "payment": payment,
      };
}

class Item {
  Item({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.qty,
  });

  final String? id;
  final String? imageUrl;
  final String? name;
  final String? price;
  final int? qty;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        "price": price,
        "qty": qty,
      };
}

class Vendor {
  Vendor({
    required this.email,
    required this.id,
    required this.name,
  });

  final String? email;
  final String? id;
  final String? name;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "name": name,
      };
}
