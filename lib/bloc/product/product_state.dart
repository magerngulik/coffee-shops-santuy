// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

// ignore: must_be_immutable
class ProductState extends Equatable {
  ProductState({
    this.listData = const <Product>[],
    this.listSelected = const <Product>[],
    this.listCart = const <CartModel>[],
  });
  List<Product> listData;
  List<Product> listSelected;
  List<CartModel> listCart;

  @override
  List<Object> get props => [listData, listSelected, listCart];
  Map<String, dynamic> toMap() {
    return {
      "product": listData.map((e) => e.toMap()).toList(),
      "selected": listSelected.map((e) => e.toMap()).toList(),
      "cart": listCart.map((e) => e.toMap()).toList(),
    };
  }

  factory ProductState.fromMap(Map<String, dynamic> map) {
    return ProductState(
      listData: List<Product>.from(
        (map['product'])?.map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
      listSelected: List<Product>.from(
        (map['selected'])?.map<Product>(
          (x) => Product.fromMap(x),
        ),
      ),
      listCart: List<CartModel>.from(
        (map['cart'])?.map<CartModel>(
          (x) => CartModel.fromMap(x),
        ),
      ),
    );
  }
}
