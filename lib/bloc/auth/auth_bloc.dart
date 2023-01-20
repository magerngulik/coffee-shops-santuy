import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:coffee_shops_santuy/data/provider/auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnAuthenticated()) {
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        if (event.isMember == true) {
          await AuthService.doLoginAsMember();
        }
        if (event.isVendor == true) {
          await AuthService.doLoginAsVendor();
        }
        emit(Authenticated(isMember: event.isMember, isVendor: event.isVendor));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await AuthService.doLogout();
      emit(UnAuthenticated());
    });

    on<updatePointRequest>((event, emit) async {
      emit(Loading());
      // await AuthService.isVendor;
      // emit(UnAuthenticated());
    });
  }
}
