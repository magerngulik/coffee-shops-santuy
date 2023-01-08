import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_local_storage/data/model/user_model.dart';
import 'package:testing_local_storage/data/provider/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UpdateUserEvent>((event, emit) {
      emit(Loading());
      try {
        UserService.updateProfile(event.user);
        emit(Finish());
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
