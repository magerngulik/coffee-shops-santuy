import 'package:bloc/bloc.dart';
import 'package:coffee_shops_santuy/services/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      // ignore: prefer_const_literals_to_create_immutables
      : super(ProductInitial([])) {
    on<AddProductEvent>((event, emit) {
      try {
        emit(ProductLoading(state.listProductMenu));
        state.listProductMenu.add(event.product);
        emit(ProductFinish(state.listProductMenu));
      } catch (e) {
        emit(ProductError(state.listProductMenu));
      }
    });

    on<DeleteProductEvent>((event, emit) {
      try {
        emit(ProductLoading(state.listProductMenu));
        state.listProductMenu.removeWhere((element) {
          return element.id == event.product.id;
        });

        emit(ProductFinish(state.listProductMenu));
      } catch (e) {
        emit(ProductError(state.listProductMenu));
      }
    });
  }
}
