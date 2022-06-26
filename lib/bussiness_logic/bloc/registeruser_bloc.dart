import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registeruser_event.dart';
part 'registeruser_state.dart';

class RegisteruserBloc extends Bloc<RegisteruserEvent, RegisteruserState> {
  RegisteruserBloc() : super(RegisteruserInitial()) {
    on<UserRegisterSubmittedEvent>((event, emit) async {
      emit(UserRegisterSubmittedState());
      await Future.delayed(const Duration(seconds: 1)).then((value) {
        emit(UserRegisterSubmittedSuccessState());
      });
    });
  }
}
