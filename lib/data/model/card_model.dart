// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:coffee_shops_santuy/data/model/product.dart';

class CartModel {
  String? id;
  Product? item;
  DateTime? createdAt;
  String? topping;
  String? drinkSize;
  int? qty;

  CartModel({
    this.id,
    this.item,
    this.createdAt,
    this.topping,
    this.drinkSize,
    this.qty,
  });

  CartModel copyWith({
    String? id,
    Product? item,
    DateTime? createdAt,
    String? topping,
    String? drinkSize,
    int? qty,
  }) {
    return CartModel(
      id: id ?? this.id,
      item: item ?? this.item,
      createdAt: createdAt ?? this.createdAt,
      topping: topping ?? this.topping,
      drinkSize: drinkSize ?? this.drinkSize,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'item': item?.toMap(),
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'topping': topping,
      'drinkSize': drinkSize,
      'qty': qty,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as String : null,
      item: map['item'] != null
          ? Product.fromMap(map['item'] as Map<String, dynamic>)
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      topping: map['topping'] != null ? map['topping'] as String : null,
      drinkSize: map['drinkSize'] != null ? map['drinkSize'] as String : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(id: $id, item: $item, createdAt: $createdAt, topping: $topping, drinkSize: $drinkSize, qty: $qty)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.item == item &&
        other.createdAt == createdAt &&
        other.topping == topping &&
        other.drinkSize == drinkSize &&
        other.qty == qty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        item.hashCode ^
        createdAt.hashCode ^
        topping.hashCode ^
        drinkSize.hashCode ^
        qty.hashCode;
  }
}
