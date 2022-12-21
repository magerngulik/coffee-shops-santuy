part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  CheckoutState(this.listCheckout);

  List<CheckoutModel> listCheckout;

  @override
  List<Object> get props => [listCheckout];
}

class CheckoutInitial extends CheckoutState {
  CheckoutInitial(super.listCheckout);
}

class CheckoutLoading extends CheckoutState {
  CheckoutLoading(super.listCheckout);
}

class CheckoutFinish extends CheckoutState {
  CheckoutFinish(super.listCheckout);
}

class CheckoutError extends CheckoutState {
  CheckoutError(super.listCheckout);
}
