import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_app/presentation/helpers/constant_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final IconData? sufficiconData;
  final String hintText;
  final TextInputType keyBoardType;
  final IconData? iconData;
  final bool obscure;
  final VoidCallback? suffixAction;
  final TextInputAction? nextAction;
  final TextCapitalization? textCapitalisation;
  final bool? isEnabled;
  const CustomTextFormField({
    Key? key,
    this.validator,
    this.sufficiconData,
    required this.hintText,
    required this.keyBoardType,
    required this.iconData,
    this.obscure = false,
    this.suffixAction,
    this.nextAction,
    this.textCapitalisation,
    this.isEnabled,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalisation ?? TextCapitalization.none,
      textInputAction: nextAction ?? TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscure,
      controller: textController,
      keyboardType: keyBoardType,
      enabled: isEnabled ?? true,
      validator: validator,
      keyboardAppearance: Brightness.dark,
      style: GoogleFonts.ubuntu(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: suffixAction ?? () {},
            child: Icon(
              sufficiconData,
              size: 17,
              color: iconColor,
            )),
        prefixIcon: Icon(
          iconData,
          size: 17,
          color: iconColor,
        ),
        hintStyle: normalTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
