
enum ValidatorType {
  email,
  empty,
  integer,
  code,
  name,
  password,
}

class Validators {
  static String? emailValidation(String? email) {
    if (email == null || email.replaceAll(' ', '') == '') {
      return 'Поле не может быть пустым';
    }

    //Тоже валидирует во многих случаях, но не во всех вроде
    // static const String emailRegex =
    //     r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";

    RegExp regExp = RegExp(
        r"[-0-9!#$%&'*+/=?^_`{|}~A-Za-z]+(?:\.[-0-9!#$%&'*+/=?^_`{|}~A-Za-z]+)*@(?:[0-9A-Za-z](?:[-0-9A-Za-z]*[0-9A-Za-z])?\.)+[0-9A-Za-z](?:[-0-9A-Za-z]*[0-9A-Za-z])?",
        caseSensitive: false,
        multiLine: false);
    if (!regExp.hasMatch(email)) {
      return 'Недопустимый формат Email';
    }

    return null;
  }

  static String? emptyValidation(String? text) {
    if (text == null || text.replaceAll(' ', '') == '') {
      return 'Поле не может быть пустым';
    }
    return null;
  }

  static String? intValidation(String? text) {
    if (text == null || text.replaceAll(' ', '') == '') {
      return 'Поле не может быть пустым';
    }
    if (int.tryParse(text) == null) {
      return 'Должно быть указано число';
    }
    return null;
  }

  static String? codeValidation(String? code, int minLength) {
    if (code == null || code.replaceAll(' ', '') == '') {
      return 'Поле не может быть пустым';
    }

    if (code.length < minLength) {
      return 'Код должен содержать $minLength или более символов';
    }

    RegExp regExp = RegExp(r"[0-9]", caseSensitive: false, multiLine: false);
    if (!regExp.hasMatch(code)) {
      return 'Недопустимый формат для кода';
    }
    return null;
  }

  static String? nameValidation(String? name, int minLength) {
    if (name == null || name.replaceAll(' ', '') == '') {
      return 'Поле не может быть пустым';
    }

    if (name.length < minLength) {
      // return 'Ваше имя должно содержать $minLength или более символов';
      return 'Ваше имя должно содержать $minLength и не более 32 символов';
    }
    if (name.length >= 32) {
      return 'Ваше имя должно содержать $minLength и не более 32 символов';
    }

    RegExp regExp =
    RegExp(r"^[\w\W]{1,32}$", caseSensitive: false, multiLine: false);
    if (!regExp.hasMatch(name)) {
      return 'Недопустимый формат';
    }

    return null;
  }

  static PasswordValidationResult passwordValidation(
      String? password, int minLength) {
    if (password == null || password.replaceAll(' ', '') == '') {
      return PasswordValidationResult(true, false, false, false);
    }

    var eightSymbols = password.length >= minLength;

    RegExp regExp = RegExp(
        r"^(?=\D*\d)(?=.*[A-Z])(?=.*[a-z])[ A-Za-z0-9!%&?]*$"); //, caseSensitive: true, multiLine: false);
    var capitalLettersNumbers = regExp.hasMatch(password);

    var specialSymbols = password.contains("%") ||
        password.contains("&") ||
        password.contains("!") ||
        password.contains("?");

    return PasswordValidationResult(
        false, eightSymbols, capitalLettersNumbers, specialSymbols);
  }
}

class PasswordValidationResult {
  PasswordValidationResult(
      this.empty,
      this.eightSymbols,
      this.capitalLettersNumbers,
      this.specialSymbols,
      );

  final bool empty;
  final bool eightSymbols;
  final bool capitalLettersNumbers;
  final bool specialSymbols;

  bool get passwordValidated =>
      specialSymbols && eightSymbols && capitalLettersNumbers;

  String? get errorMessage {
    if (empty) return 'Поле не может быть пустым';
    if (passwordValidated) return null;
    return "Все условия должны быть соблюдены";
  }
}
