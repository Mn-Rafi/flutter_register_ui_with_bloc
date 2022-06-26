import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeicon_state.dart';

class ChangeiconCubit extends Cubit<ChangeiconState> {
  ChangeiconCubit() : super(ChangeiconInitial());
  void changeIcon() {
    emit(Changeiconpressed());
  }
}
