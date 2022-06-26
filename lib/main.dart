import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/bussiness_logic/bloc/registeruser_bloc.dart';
import 'package:login_app/presentation/screens/screen_reister.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisteruserBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenRegister(),
      ),
    );
  }
}
