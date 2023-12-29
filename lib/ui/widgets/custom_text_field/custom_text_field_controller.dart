part of '../../../ice_flutter_toolkit.dart';

class CustomTextFieldController extends CustomTextFieldControllerBase
    with _$CustomTextFieldController {
  CustomTextFieldController({bool obscure = false}) : super(obscure);
}

abstract class CustomTextFieldControllerBase with Store {
  CustomTextFieldControllerBase(this.obscure);

  @observable
  TextFieldState state = TextFieldState.clean;
  @observable
  String? errorMessage;
  @observable
  String oldText = "";
  @observable
  String text = "";
  @observable
  bool obscure;

  TextEditingController textEditingController = TextEditingController();

  @computed
  bool get validated => errorMessage?.isEmpty ?? true;

  @computed
  bool get isEmpty => text.isEmpty;

  @action
  void updateText(String str) {
    errorMessage = null;
    oldText = text;
    text = str;
  }

  @action
  void clear() {
    text = "";
    textEditingController.clear();
  }

  @action
  void switchObscure() {
    obscure = !obscure;
  }

  Future<bool> validate(ValidatorType validator,
          {String? text, int? minLength}) async =>
      await validateWithIndex(text ?? this.text, validator.index, minLength: minLength);

  @action
  Future<bool> validateWithIndex(String? text, int validator, {int? minLength}) async {
    ValidatorType type = ValidatorType
        .values[validator.clamp(0, ValidatorType.values.length - 1)];

    PasswordValidationResult result =
        PasswordValidationResult(false, false, false, false);

    switch (type) {
      case ValidatorType.email:
        errorMessage = Validators.emailValidation(text);
        break;
      case ValidatorType.empty:
        errorMessage = Validators.emptyValidation(text);
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
        result = Validators.passwordValidation(text, minLength ?? 8);
        break;
    }

    if (type == ValidatorType.password) {
      errorMessage = result.errorMessage;
      eightSymbols = result.eightSymbols;
      capitalLettersNumbers = result.capitalLettersNumbers;
      specialSymbols = result.specialSymbols;
    }

    if (errorMessage != null) {
      state = TextFieldState.error;
      return false;
    }

    state = TextFieldState.correct;
    return true;
  }

  @computed
  bool get passwordValidated =>
      specialSymbols && eightSymbols && capitalLettersNumbers;
  @observable
  bool eightSymbols = false;
  @observable
  bool capitalLettersNumbers = false;
  @observable
  bool specialSymbols = false;
}

enum TextFieldState {
  correct,
  error,
  clean,
}
