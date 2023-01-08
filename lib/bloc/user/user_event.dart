// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserEvent extends UserEvent {
  UserModel user;
  UpdateUserEvent({
    required this.user,
  });
}
