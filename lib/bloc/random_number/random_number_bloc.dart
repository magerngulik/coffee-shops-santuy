import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'random_number_event.dart';
part 'random_number_state.dart';

class RandomNumberBloc
    extends HydratedBloc<RandomNumberEvent, RandomNumberState> {
  RandomNumberBloc() : super(RandomNumberInitial(0)) {
    on<IncrementNumber>((event, emit) {
      try {
        emit(RandomNumberLoading(state.number + 1));
      } catch (e) {
        emit(RandomNumberError(state.number, e.toString()));
      }
    });

    on<DecrementNumber>((event, emit) {
      try {
        emit(RandomNumberLoading(state.number));
        if (state.number < 0) {
          return;
        }

        emit(RandomNumberFinish(state.number - 1));
      } catch (e) {
        emit(RandomNumberError(state.number, e.toString()));
      }
    });
  }

  @override
  RandomNumberState? fromJson(Map<String, dynamic> json) {
    return RandomNumberState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RandomNumberState state) {
    return state.toMap();
  }
}
