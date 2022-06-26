mixin TextFieldValidatorMixin {
  String? isPasswordValid(String? value) {
    if (value!.length < 8) {
      return "password must contain 8 characters";
    } else {
      return null;
    }
  }

  String? isMobileValid(String? value) {
    String pattern = r'^[6789]\d{9}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "mobile can't be empty";
    }
    if (value.length < 10 || value.length > 10 || !regExp.hasMatch(value)) {
      return "please enter a valid mobile number";
    } else {
      return null;
    }
  }

  String? isNameValid(String? value, String? type) {
    if (value!.isEmpty) {
      return "$type can't be empty";
    }
    if (value.isNotEmpty && value.length < 3) {
      return "please enter a valid $type";
    } else {
      return null;
    }
  }

  String? isSelectedDob(String? value, String? type) {
    if (value!.isEmpty) {
      return 'please choose $type';
    } else {
      return null;
    }
  }
}
