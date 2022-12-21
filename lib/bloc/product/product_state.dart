part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  ProductState(this.listProductMenu);

  List<ProductModel> listProductMenu;

  @override
  List<Object> get props => [listProductMenu];
}

class ProductInitial extends ProductState {
  ProductInitial(super.listProductMenu);
}

class ProductLoading extends ProductState {
  ProductLoading(super.listProductMenu);
}

class ProductFinish extends ProductState {
  ProductFinish(super.listProductMenu);
}

class ProductError extends ProductState {
  ProductError(super.listProductMenu);
}
