import 'package:bloc/bloc.dart';

class VisibleCubit extends Cubit<bool> {
  VisibleCubit() : super(false);
  changeVisible() => emit(!state);
}
