// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ProductEvent {
  const AddProductEvent(this.product);
  final ProductModel product;
}

class DeleteProductEvent extends ProductEvent {
  final ProductModel product;
  const DeleteProductEvent({
    required this.product,
  });
}
