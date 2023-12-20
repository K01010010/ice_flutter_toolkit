// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_text_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomTextFieldController on CustomTextFieldControllerBase, Store {
  Computed<bool>? _$validatedComputed;

  @override
  bool get validated =>
      (_$validatedComputed ??= Computed<bool>(() => super.validated,
              name: 'CustomTextFieldControllerBase.validated'))
          .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: 'CustomTextFieldControllerBase.isEmpty'))
      .value;
  Computed<bool>? _$passwordValidatedComputed;

  @override
  bool get passwordValidated => (_$passwordValidatedComputed ??= Computed<bool>(
          () => super.passwordValidated,
          name: 'CustomTextFieldControllerBase.passwordValidated'))
      .value;

  late final _$stateAtom =
      Atom(name: 'CustomTextFieldControllerBase.state', context: context);

  @override
  TextFieldState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(TextFieldState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: 'CustomTextFieldControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$oldTextAtom =
      Atom(name: 'CustomTextFieldControllerBase.oldText', context: context);

  @override
  String get oldText {
    _$oldTextAtom.reportRead();
    return super.oldText;
  }

  @override
  set oldText(String value) {
    _$oldTextAtom.reportWrite(value, super.oldText, () {
      super.oldText = value;
    });
  }

  late final _$textAtom =
      Atom(name: 'CustomTextFieldControllerBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$obscureAtom =
      Atom(name: 'CustomTextFieldControllerBase.obscure', context: context);

  @override
  bool get obscure {
    _$obscureAtom.reportRead();
    return super.obscure;
  }

  @override
  set obscure(bool value) {
    _$obscureAtom.reportWrite(value, super.obscure, () {
      super.obscure = value;
    });
  }

  late final _$eightSymbolsAtom = Atom(
      name: 'CustomTextFieldControllerBase.eightSymbols', context: context);

  @override
  bool get eightSymbols {
    _$eightSymbolsAtom.reportRead();
    return super.eightSymbols;
  }

  @override
  set eightSymbols(bool value) {
    _$eightSymbolsAtom.reportWrite(value, super.eightSymbols, () {
      super.eightSymbols = value;
    });
  }

  late final _$capitalLettersNumbersAtom = Atom(
      name: 'CustomTextFieldControllerBase.capitalLettersNumbers',
      context: context);

  @override
  bool get capitalLettersNumbers {
    _$capitalLettersNumbersAtom.reportRead();
    return super.capitalLettersNumbers;
  }

  @override
  set capitalLettersNumbers(bool value) {
    _$capitalLettersNumbersAtom.reportWrite(value, super.capitalLettersNumbers,
        () {
      super.capitalLettersNumbers = value;
    });
  }

  late final _$specialSymbolsAtom = Atom(
      name: 'CustomTextFieldControllerBase.specialSymbols', context: context);

  @override
  bool get specialSymbols {
    _$specialSymbolsAtom.reportRead();
    return super.specialSymbols;
  }

  @override
  set specialSymbols(bool value) {
    _$specialSymbolsAtom.reportWrite(value, super.specialSymbols, () {
      super.specialSymbols = value;
    });
  }

  late final _$validateWithIndexAsyncAction = AsyncAction(
      'CustomTextFieldControllerBase.validateWithIndex',
      context: context);

  @override
  Future<bool> validateWithIndex(String? text, int validator,
      {int? minLength}) {
    return _$validateWithIndexAsyncAction.run(
        () => super.validateWithIndex(text, validator, minLength: minLength));
  }

  late final _$CustomTextFieldControllerBaseActionController =
      ActionController(name: 'CustomTextFieldControllerBase', context: context);

  @override
  void updateText(String str) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.updateText');
    try {
      return super.updateText(str);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchObscure() {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.switchObscure');
    try {
      return super.switchObscure();
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage},
oldText: ${oldText},
text: ${text},
obscure: ${obscure},
eightSymbols: ${eightSymbols},
capitalLettersNumbers: ${capitalLettersNumbers},
specialSymbols: ${specialSymbols},
validated: ${validated},
isEmpty: ${isEmpty},
passwordValidated: ${passwordValidated}
    ''';
  }
}
