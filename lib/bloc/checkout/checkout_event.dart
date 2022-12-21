part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class AddCheckoutEvent extends CheckoutEvent {
  const AddCheckoutEvent(this.checkout);
  final CheckoutModel checkout;
}

class EditCheckoutEvent extends CheckoutEvent {
  const EditCheckoutEvent(this.checkout);
  final CheckoutModel checkout;
}
