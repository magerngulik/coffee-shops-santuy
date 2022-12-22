// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_shops_santuy/services/product_model.dart';

class CheckoutModel {
  int? id;
  ProductModel? itemChekout;
  DateTime? date;
  int? jumlah;
  CheckoutModel({
    this.id,
    this.itemChekout,
    this.date,
    this.jumlah,
  });

  CheckoutModel copyWith({
    int? id,
    ProductModel? itemChekout,
    DateTime? date,
    int? jumlah,
  }) {
    return CheckoutModel(
      id: id ?? this.id,
      itemChekout: itemChekout ?? this.itemChekout,
      date: date ?? this.date,
      jumlah: jumlah ?? this.jumlah,
    );
  }
}
