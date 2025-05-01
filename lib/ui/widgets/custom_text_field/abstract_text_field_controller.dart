part of '../../../ice_flutter_toolkit.dart';

abstract class AbstractTextFieldController {


  AbstractTextFieldController(this.enableObscure, [this._focusNode]) {
    initFocusNode();
  }

  void initFocusNode({FocusNode? node}) {
    if(node!=null) { _focusNode = node; }
    _focusNode?.addListener(changeFocus);
  }

  void disposeFocusNode() {
    _focusNode?.dispose();
  }

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


  FocusNode? _focusNode;
  bool get focused;
  set focused(bool val);
  void changeFocus([bool? val]) => focused = val ?? _focusNode?.hasFocus ?? !focused;

  final bool enableObscure;
  bool get obscure;
  set obscure(bool val);

  @action
  void switchObscure([bool? val]) {
    if (!enableObscure) return;
    obscure = val ?? !obscure;
  }

  bool get readOnly;
  set readOnly(bool val);
  void switchReadOnly([bool? val]) => readOnly = val ?? !readOnly;
}
enum InputBorderType {
  none, underline, outline
}

// class BoolController = BoolControllerBase with _$BoolController;
//
// abstract class BoolControllerBase with Store {
//   BoolControllerBase(this.value);
//
//   @observable
//   bool value;
//   @action
//   void change({bool? val}) => value = val ?? !value;
// }