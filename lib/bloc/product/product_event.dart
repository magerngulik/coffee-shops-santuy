// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ProductEvent {
  const AddProductEvent(this.product);
  final Product product;
}

class DeleteProductEvent extends ProductEvent {
  final Product product;
  const DeleteProductEvent({
    required this.product,
  });
}

class UpdateProductEvent extends ProductEvent {
  final Product product;
  const UpdateProductEvent(
    this.product,
  );
}

class SelectProductEvent extends ProductEvent {
  final String searching;
  const SelectProductEvent(
    this.searching,
  );
}

class AddCartEvent extends ProductEvent {
  const AddCartEvent(this.product);
  final CartModel product;
}

class AddQtyEvent extends ProductEvent {
  const AddQtyEvent(this.product);
  final CartModel product;
}

class RemoveQtyEvent extends ProductEvent {
  const RemoveQtyEvent(this.product);
  final CartModel product;
}

class DelectSelectEvent extends ProductEvent {}

class SelectAllEvent extends ProductEvent {}

class DeleteCheckoutEvent extends ProductEvent {}

class CheckoutEvent extends ProductEvent {
  Checkout item;
  CheckoutEvent({
    required this.item,
  });
}
