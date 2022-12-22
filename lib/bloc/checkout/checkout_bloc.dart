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
        if (state.listCheckout
            .where((element) =>
                element.itemChekout!.name == event.checkout.itemChekout!.name)
            .isEmpty) {
          state.listCheckout.add(event.checkout);
        } else {}

        emit(CheckoutFinish(state.listCheckout));
      } catch (e) {
        emit(CheckoutError(state.listCheckout));
      }
    });

    on<AddQuantityEvent>((event, emit) {
      try {
        emit(CheckoutLoading(state.listCheckout));
        CheckoutModel selectedData = state.listCheckout
            .where((element) => element.id == event.checkout.id)
            .first;
        selectedData.jumlah = selectedData.jumlah! + 1;

        emit(CheckoutFinish(state.listCheckout));
      } catch (e) {
        emit(CheckoutError(state.listCheckout));
      }
    });

    on<removeQuantityEvent>((event, emit) {
      try {
        emit(CheckoutLoading(state.listCheckout));
        CheckoutModel selectedData = state.listCheckout
            .where((element) => element.id == event.checkout.id)
            .first;
        if (selectedData.jumlah! > 1) {
          selectedData.jumlah = selectedData.jumlah! - 1;
        } else {
          state.listCheckout
              .removeWhere((element) => element.id == event.checkout.id);
        }

        emit(CheckoutFinish(state.listCheckout));
      } catch (e) {
        emit(CheckoutError(state.listCheckout));
      }
    });

    // on<EditUserEvent>((event, emit) {
    //   try {
    //     emit(UserLoading(state.allUser));
    //     User seledtedUser =
    //         state.allUser.where((element) => element.id == event.user.id).first;
    //     seledtedUser.name = event.user.name;
    //     seledtedUser.age = event.user.age;
    //     emit(UserFinish(state.allUser));
    //   } catch (e) {
    //     emit(UserError(state.allUser));
    //   }
    // });
  }
}
