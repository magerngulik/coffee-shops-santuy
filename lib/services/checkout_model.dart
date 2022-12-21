// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_shops_santuy/services/product_model.dart';

class CheckoutModel {
  int? id;
  List<ProductModel>? itemChekout;
  DateTime? date;
  CheckoutModel({
    this.id,
    this.itemChekout,
    this.date,
  });
}
