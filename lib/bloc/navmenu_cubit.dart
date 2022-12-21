import 'package:bloc/bloc.dart';

class NavmenuCubit extends Cubit<bool> {
  NavmenuCubit() : super(true);
  activator() => emit(!state);
}
