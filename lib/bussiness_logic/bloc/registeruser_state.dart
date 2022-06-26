part of 'registeruser_bloc.dart';

@immutable
abstract class RegisteruserState {}

class RegisteruserInitial extends RegisteruserState {}

class UserRegisterSubmittedState extends RegisteruserState {}


class UserRegisterSubmittedSuccessState extends RegisteruserState {}