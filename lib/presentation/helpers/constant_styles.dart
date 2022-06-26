import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const hspace1 = SizedBox(
  height: 10,
  width: double.infinity,
);

const iconColor = Color.fromARGB(255, 39, 39, 39);

const BoxDecoration kboxdecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)]));

final mainHeaderStyle = GoogleFonts.exo(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);
final normalTextStyle =
    GoogleFonts.quicksand(fontSize: 13, fontWeight: FontWeight.w500);
void showInfoFlushbar(
    {required BuildContext context,
    required String title,
    required String message}) {
  Flushbar(
    title: title,
    message: message,
    icon: Icon(
      Icons.info_outline,
      size: 28,
      color: Colors.blue.shade300,
    ),
    leftBarIndicatorColor: Colors.blue.shade300,
    duration: const Duration(seconds: 2),
  ).show(context);
}
