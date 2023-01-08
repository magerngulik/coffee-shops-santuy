// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  bool isMember;
  bool isVendor;
  Authenticated({
    required this.isMember,
    required this.isVendor,
  });
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);
}

class Loading extends AuthState {}
