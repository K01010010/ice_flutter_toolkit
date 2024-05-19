// library abstract_text_field_controller;
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:ice_flutter_toolkit/ice_flutter_toolkit.dart';

part of '../../../ice_flutter_toolkit.dart';
// import 'package:mobx/mobx.dart';
//
// part './custom_text_field.dart';
// part './custom_search_text_field.dart';
// part './custom_text_field_controller.dart';
// part './abstract_text_field_controller.g.dart';
// part './custom_search_text_field_controller.dart';
// part './custom_search_text_field_controller.g.dart';


abstract class AbstractTextFieldController {
  AbstractTextFieldController(this.enableObscure);


  // final bool enableObscure;
  // TextFieldState state = TextFieldState.clean;
  String? get errorMessage;
  set errorMessage(String? val);

  // String oldText = "";
  // String text = "";
  TextEditingController get textEditingController; // = TextEditingController();

  bool get validated;

  bool get isEmpty;

  void updateText(String str);

  void clear();


  bool validateWithIndex(String? text, int validator,
      {int? minLength, int? maxLength, String? startWith}) {
    ValidatorType type = ValidatorType
        .values[validator.clamp(0, ValidatorType.values.length - 1)];

    switch (type) {
      case ValidatorType.email:
        errorMessage = Validators.emailValidation(text);
        break;
      case ValidatorType.empty:
        errorMessage = Validators.emptyValidation(text, maxLength);
        break;
      case ValidatorType.url:
        errorMessage = Validators.urlValidation(text);
        break;
      case ValidatorType.integer:
        errorMessage = Validators.intValidation(text);
        break;
      case ValidatorType.code:
        errorMessage = Validators.codeValidation(text, minLength ?? 4);
        break;
      case ValidatorType.name:
        errorMessage = Validators.nameValidation(text, minLength ?? 4);
        break;
      case ValidatorType.password:
        return false;
      case ValidatorType.emailOrPhone:
        errorMessage = Validators.emailValidation(text);
      case ValidatorType.phone:
        errorMessage = Validators.phoneValidation(text, startWith: startWith);
    }

    if (errorMessage != null) return false;
    return true;
  }



  final bool enableObscure;
  bool get obscure;
  set obscure(bool val);

  @action
  void switchObscure() {
    if (!enableObscure) return;
    obscure = !obscure;
  }

  bool get readOnly;
  set readOnly(bool val);
  void switchReadOnly({bool? val}) => readOnly = val ?? !readOnly;
}
enum InputBorderType {
  none, underline, outline
}