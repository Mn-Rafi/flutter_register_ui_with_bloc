import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:login_app/presentation/helpers/date_formatter.dart';
import 'package:login_app/presentation/screens/screen_reister.dart';
import 'package:meta/meta.dart';

part 'pickdateofbirth_state.dart';

class PickdateofbirthCubit extends Cubit<PickdateofbirthState> {
  PickdateofbirthCubit()
      : super(PickdateofbirthInitial(initialDate: dateFormat(DateTime.now())));

  void pickDate(BuildContext context) async {
    emit(PickdateofbirthInitial(initialDate: dateFormat(DateTime.now())));
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(
        2023,
      ),
    );
    if (selected != null) {
      RegisterScreenBody.dobController.text = dateFormat(selected);
      emit(PickdateofbirthEnd(message: dateFormat(selected)));
    }
  }
}
