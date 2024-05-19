part of '../../../ice_flutter_toolkit.dart';

class CustomTextFieldController = CustomTextFieldControllerBase with _$CustomTextFieldController;

abstract class CustomTextFieldControllerBase extends AbstractTextFieldController
    with Store {
  CustomTextFieldControllerBase([super.enableObscure = false]);

  @observable
  TextFieldState state = TextFieldState.clean;
  @override
  @observable
  String? errorMessage;
  @observable
  String oldText = "";
  @observable
  String text = "";

  @override
  TextEditingController textEditingController = TextEditingController();

  @override
  @computed
  bool get validated => errorMessage?.isEmpty ?? true;

  @override
  @computed
  bool get isEmpty => text.isEmpty;

  @override
  @action
  void updateText(String str) {
    textEditingController.text = str;
    errorMessage = null;
    oldText = text;
    text = str;
    numberSymbols = false;
    capitalLettersNumbers = false;
    specialSymbols = false;
  }

  @override
  @action
  void clear() => updateText("");

  // { errorMessage = null; text = ""; textEditingController.clear(); }

  @action
  bool validate(ValidatorType validator,
          {String? text, int? minLength, int? maxLength, String? startWith}) =>
      validateWithIndex(
        text ?? this.text,
        validator.index,
        minLength: minLength,
        maxLength: maxLength,
        startWith: startWith,
      );

  @action
  @override
  bool validateWithIndex(String? text, int validator,
      {int? minLength, int? maxLength, String? startWith}) {
    if (validator == ValidatorType.password.index) {
      final result = Validators.passwordValidation(text,
          minLength: minLength, maxLength: maxLength);

      errorMessage = result.errorMessage;
      numberSymbols = result.numberSymbols;
      capitalLettersNumbers = result.capitalLettersNumbers;
      specialSymbols = result.specialSymbols;

      if (errorMessage != null) {
        state = TextFieldState.error;
        return false;
      }
      state = TextFieldState.correct;
      return true;
    }

    return super.validateWithIndex(
      text,
      validator,
      minLength: minLength,
      maxLength: maxLength,
      startWith: startWith,
    );
  }

  @computed
  bool get passwordValidated =>
      specialSymbols && numberSymbols && capitalLettersNumbers;
  @observable
  bool numberSymbols = false;
  @observable
  bool capitalLettersNumbers = false;
  @observable
  bool specialSymbols = false;

  @override @observable
  bool obscure = false;
  @override @action
  void switchObscure() {
    if (!enableObscure) return;
    obscure = !obscure;
  }

  @override @observable
  bool readOnly = false;
  @override @action
  void switchReadOnly({bool? val}) => readOnly = val ?? !readOnly;
}

enum TextFieldState {
  correct,
  error,
  clean,
}
