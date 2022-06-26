import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  const CustomSubmitButton({
    Key? key,
    required this.text,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: width * 0.5,
      height: height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.02),
        color: bgColor,
      ),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
      ),
    );
  }
}

class CustomLoadingSubmitButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  const CustomLoadingSubmitButton({
    Key? key,
    required this.text,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: width * 0.5,
      height: height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.02),
        color: bgColor,
      ),
      child: SizedBox(
          height: height * 0.025,
          width: height * 0.025,
          child: const CircularProgressIndicator(
            color: Colors.white,
          )),
    );
  }
}
