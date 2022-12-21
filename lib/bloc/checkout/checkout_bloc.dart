import 'package:bloc/bloc.dart';
import 'package:coffee_shops_santuy/services/checkout_model.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  // ignore: prefer_const_literals_to_create_immutables
  CheckoutBloc() : super(CheckoutInitial([])) {
    on<AddCheckoutEvent>((event, emit) {
      try {
        emit(CheckoutLoading(state.listCheckout));
        state.listCheckout.add(event.checkout);
        emit(CheckoutFinish(state.listCheckout));
      } catch (e) {
        emit(CheckoutError(state.listCheckout));
      }
    });
  }
}
