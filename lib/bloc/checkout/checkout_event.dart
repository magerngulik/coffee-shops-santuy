// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class AddQuantityEvent extends CheckoutEvent {
  final CheckoutModel checkout;
  const AddQuantityEvent({
    required this.checkout,
  });
}

class removeQuantityEvent extends CheckoutEvent {
  final CheckoutModel checkout;
  const removeQuantityEvent({
    required this.checkout,
  });
}
