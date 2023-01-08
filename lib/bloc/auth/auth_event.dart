// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GoogleSignInRequested extends AuthEvent {
  bool isMember;
  bool isVendor;
  GoogleSignInRequested({
    required this.isMember,
    required this.isVendor,
  });
}

class updatePointRequest extends AuthEvent {}

class SignOutRequested extends AuthEvent {}
