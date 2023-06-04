import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

MultiValidator schoolMailValidator() {
  return MultiValidator([
    EmailValidator(errorText: "Invalid Email"),
    RequiredValidator(errorText: "Please enter your email"),
    PatternValidator('esi-sba.dz', errorText: 'Please use your school email')
  ]);
}

MultiValidator passwordValidator() {
  return MultiValidator([
    MinLengthValidator(6,
        errorText: "Your password must be at least 6 caracters"),
    MaxLengthValidator(15,
        errorText: "Your password can't be longer than 15 caracters"),
    RequiredValidator(errorText: "Password is required"),
  ]);
}

MultiValidator confirmPasswordValidator(TextEditingController passController) {
  return MultiValidator([
    MinLengthValidator(6,
        errorText: "Your password must be at least 6 caracters"),
    MaxLengthValidator(15,
        errorText: "Your password can't be longer than 15 caracters"),
    RequiredValidator(errorText: "Password is required"),
    MatchingPassword(controller: passController),
  ]);
}

class MatchingPassword extends TextFieldValidator {
  // pass the error text to the super constructor
  MatchingPassword(
      {String errorText = 'Password does not match', required this.controller})
      : super(errorText);

  final TextEditingController controller;
  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String? value) {
    // return true if the value is valid according the your condition
    return (value! == controller.text);
  }
}

MultiValidator requiredFieldValidator() {
  return MultiValidator([
    RequiredValidator(errorText: "This field is required"),
  ]);
}
