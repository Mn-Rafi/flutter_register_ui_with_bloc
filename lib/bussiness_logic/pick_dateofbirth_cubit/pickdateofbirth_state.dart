part of 'pickdateofbirth_cubit.dart';

@immutable
abstract class PickdateofbirthState {}

class PickdateofbirthInitial extends PickdateofbirthState {
  final String initialDate;
  PickdateofbirthInitial({
    required this.initialDate,
  });
}

class PickdateofbirthCancelled extends PickdateofbirthState {
  final String message;
  PickdateofbirthCancelled({
    required this.message,
  });
}

class PickdateofbirthEnd extends PickdateofbirthState {
  final String message;
  PickdateofbirthEnd({
    required this.message,
  });
}
