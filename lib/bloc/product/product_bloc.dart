import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:coffee_shops_santuy/data/model/card_model.dart';
import 'package:coffee_shops_santuy/data/model/checkout_model.dart';
import 'package:coffee_shops_santuy/data/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<AddProductEvent>(_onAdd);
    on<DeleteProductEvent>(_onDelete);
    on<UpdateProductEvent>(_onUpdate);
    on<SelectProductEvent>(_onSelected);
    on<DelectSelectEvent>(_onDeleteSelected);
    on<AddCartEvent>(_onAddCart);
    on<AddQtyEvent>(_onAddQty);
    on<RemoveQtyEvent>(_onRemoveQty);
    on<DeleteCheckoutEvent>(_onDeleteCheckout);
  }

  FutureOr<void> _onAdd(AddProductEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(listData: List.from(state.listData)..add(event.product)));
  }

  FutureOr<void> _onDelete(
      DeleteProductEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        listData: List.from(state.listData)..remove(event.product)));
  }

  FutureOr<void> _onUpdate(
      UpdateProductEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        listData: List.from(state.listData)
          ..removeWhere((element) => element.id == event.product.id)
          ..add(event.product),
        listCart: state.listCart,
        listSelected: state.listSelected));
  }

  FutureOr<void> _onSelected(
      SelectProductEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    List<Product> mainList = state.listData;

    emit(ProductState(
        listData: state.listData,
        listSelected: List.from(
            mainList.where((element) => element.submenu == event.searching)),
        listCart: state.listCart));
  }

  FutureOr<void> _onDeleteSelected(
      DelectSelectEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        listSelected: List.from(state.listSelected)..clear(),
        listData: state.listData));
  }

  FutureOr<void> _onAddCart(AddCartEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        listCart: List.from(state.listCart)..add(event.product),
        listData: state.listData,
        listSelected: state.listSelected));
  }

  FutureOr<void> _onAddQty(AddQtyEvent event, Emitter<ProductState> emit) {
    final state = this.state;

    List<CartModel> cartTasks = state.listCart;
    var taskIndex = cartTasks.indexOf(event.product);
    cartTasks = List.from(cartTasks)
      ..remove(event.product)
      ..insert(
          taskIndex,
          event.product.copyWith(
            qty: event.product.qty! + 1,
          ));

    emit(ProductState(
        listCart: cartTasks,
        listData: state.listData,
        listSelected: state.listSelected));
  }

  FutureOr<void> _onRemoveQty(
      RemoveQtyEvent event, Emitter<ProductState> emit) {
    final state = this.state;

    List<CartModel> cartTasks = state.listCart;
    var taskIndex = cartTasks.indexOf(event.product);
    if (event.product.qty! < 2) {
      cartTasks = List.from(cartTasks)..remove(event.product);
    } else {
      cartTasks = List.from(cartTasks)
        ..remove(event.product)
        ..insert(
            taskIndex,
            event.product.copyWith(
              qty: event.product.qty! - 1,
            ));
    }

    emit(ProductState(
        listCart: cartTasks,
        listData: state.listData,
        listSelected: state.listSelected));
  }

  FutureOr<void> _onDeleteCheckout(
      DeleteCheckoutEvent event, Emitter<ProductState> emit) {
    final state = this.state;
    emit(ProductState(
        listCart: List.from(state.listCart)..clear(),
        listData: state.listData,
        listSelected: state.listSelected));
  }

  @override
  ProductState? fromJson(Map<String, dynamic> json) {
    return ProductState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ProductState state) {
    return state.toMap();
  }
}
