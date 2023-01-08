// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  UserState({this.user});
  UserModel? user;

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class Loading extends UserState {}

class Finish extends UserState {}

class Error extends UserState {
  String message;
  Error({
    required this.message,
  });
}
