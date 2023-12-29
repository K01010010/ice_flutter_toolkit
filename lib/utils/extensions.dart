part of '../ice_flutter_toolkit.dart';

extension FutureList on List {
  Future<Iterable<T>> transform<T>(Future<T> Function(T e) method) async {
    List<T> result = <T>[];
    for (T value in this) {
      result.add(await method(value));
    }
    return result;
  }
}

enum JustDateType {
  onlyTime,
  onlyDate,
  onlyDateNamed,
  dateTime,
  timeDate,
  dateTimeNamed,
  timeDateNamed,
  relative
}

extension DescribeDate on DateTime {
  static List<String> monthes = [
    "январь",
    "февраль",
    "март",
    "апрель",
    "май",
    "июнь",
    "июль",
    "август",
    "сентябрь",
    "октябрь",
    "ноябрь",
    "декабрь",
  ];

  String get monthDescribe => monthes[month];

  String get paddedMinute => minute.toString().padLeft(2, '0');

  String get paddedDay => day.toString().padLeft(2, '0');

  String get paddedMonth => month.toString().padLeft(2, '0');

  // justDate({JustDateType? type}) {
  //   type ??= JustDateType.onlyDate;
  //   switch (type) {
  //     case JustDateType.onlyDate : return "$day $monthDescribe $year";
  //     case JustDateType.onlyTime : return "$hour:$minute";
  //     case JustDateType.dateTime : return "$day $monthDescribe $year - $hour:$minute";
  //     case JustDateType.timeDate : return "$hour:$minute - $day $monthDescribe $year";
  //     default: break;
  //   }
  //   return "";
  // }

  String describe([JustDateType type = JustDateType.relative]) {
    switch (type) {
      case JustDateType.onlyTime:
        return "$hour:$paddedMinute";
      case JustDateType.onlyDate:
        return "$paddedDay.$paddedMonth.${year % 100}";
      case JustDateType.onlyDateNamed:
        return "$day $monthDescribe $year";
      case JustDateType.dateTime:
        return "$paddedDay.$paddedMonth.${year % 100} $hour:$paddedMinute";
      case JustDateType.timeDate:
        return "$hour:$paddedMinute $paddedDay.$paddedMonth.${year % 100}";
      case JustDateType.dateTimeNamed:
        return "$day $monthDescribe $year - $hour:$paddedMinute";
      case JustDateType.timeDateNamed:
        return "$hour:$paddedMinute - $day $monthDescribe $year";
      case JustDateType.relative:
        return _describe();
    }
  }

  String _describe() {
    var timeDifference = difference(DateTime.now());

    String long = "${timeDifference.inDays.abs()} дней назад";
    if (timeDifference.inDays <= -365) {
      long = "${(timeDifference.inDays.abs() / 365).round()} лет назад";
    }

    if (timeDifference.inDays == -1) return "вчера";
    if (timeDifference.inDays < -1) return long;
    if (timeDifference.inHours == -1 || timeDifference.inHours == -21) {
      return timeDifference.inHours == -1 ? "час назад" : "21 час назад";
    }
    if (timeDifference.inHours < -20) {
      return "${timeDifference.inHours.abs()} часа назад";
    }
    if (timeDifference.inHours < -4) {
      return "${timeDifference.inHours.abs()} часов назад";
    }
    if (timeDifference.inHours < -1) {
      return "${timeDifference.inHours.abs()} часа назад";
    }

    // if (timeDifference.inMinutes == -11) {
    //   return "11 минут назад";
    // }
    // //[10,20,30,40,50] минут назад"
    // if (timeDifference.inMinutes % 10 == 0 && timeDifference.inMinutes != 0) {
    //   return "${timeDifference.inMinutes.abs()} минут назад";
    // }
    // //[1] минуту назад [21,31,41,51] минуту назад
    // if (timeDifference.inMinutes % 10 == -1) {
    //   return timeDifference.inMinutes == -1
    //       ? "минуту назад"
    //       : "${timeDifference.inMinutes.abs()} минуту назад";
    // }
    // //[5,6,7,8,9,11,12,13,14,15,16,17,18,19] минут назад
    // if (timeDifference.inMinutes < -4 && timeDifference.inMinutes > -20) {
    //   return "${timeDifference.inMinutes.abs()} минут назад";
    // }
    //
    // //[25,26,27,28,29] минут [35,36,37,38,39] минут [45,46,47,48,49] минут [55,56,57,58,59] минут
    // if (timeDifference.inMinutes % 10 < -4) {
    //   return "${timeDifference.inMinutes.abs()} минут назад";
    // }
    //
    // //[2,3,4] минуты [22,23,24] минуты [32,33,34] минуты [42,43,44] минуты [52,53,54] минуты
    // if (timeDifference.inMinutes < -1) {
    //   return "${timeDifference.inMinutes.abs()} минуты назад";
    // }

    var result = _chooseVariant(timeDifference.inMinutes,
        firstVariant: "минуту назад",
        secondVariant: "минут назад",
        thirdVariant: "минуты назад");
    result ??= _chooseVariant(timeDifference.inSeconds,
        firstVariant: "секунду назад",
        secondVariant: "секунд назад",
        thirdVariant: "секунды назад");
    return result ?? "Только что";
  }

  String? _chooseVariant(int negativeVal,
      {String firstVariant = "минуту назад",
      String secondVariant = "минут назад",
      String thirdVariant = "минуты назад"}) {
    //[10,20,30,40,50] минут назад"
    if (negativeVal % 10 == 0 && negativeVal != 0) {
      return "${negativeVal.abs()} $secondVariant";
    }
    //[1] минуту назад [21,31,41,51] минуту назад
    if (negativeVal % 10 == -1) {
      return negativeVal == -1
          ? firstVariant
          : "${negativeVal.abs()} $firstVariant";
    }
    //[5,6,7,8,9,11,12,13,14,15,16,17,18,19] минут назад
    if (negativeVal < -4 && negativeVal > -20) {
      return "${negativeVal.abs()} $secondVariant";
    }

    //[25,26,27,28,29] минут [35,36,37,38,39] минут [45,46,47,48,49] минут [55,56,57,58,59] минут
    if (negativeVal % 10 < -4) {
      return "${negativeVal.abs()} $secondVariant";
    }

    //[2,3,4] минуты [22,23,24] минуты [32,33,34] минуты [42,43,44] минуты [52,53,54] минуты
    if (negativeVal <= -1) {
      return "${negativeVal.abs()} $thirdVariant";
    }
    return null;
  }
}

extension PrintString on String {
  void printFull({int maxSymbols = 1023}) {
    var str = this;
    while (str.length > maxSymbols) {
      String segment = str.substring(0, maxSymbols);
      print(segment);
      str = str.substring(maxSymbols);
    }

    if (str.isNotEmpty) {
      print(str);
    }
  }
}

class AppStyleBase extends AppStyle {
  AppStyleBase({
    super.errorText = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.errorText,
    ),
    super.text = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.gray12, //.gray85,
    ),
  }) {
    throw Exception("Не установлен стиль приложения");
  }

  @override
  TextStyle getTextStyle({
    required double size,
    required ui.FontWeight weight,
    required ui.Color color,
    String? fontFamily,
  }) =>
      TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size,
        fontFamily: fontFamily,
        height: 1,
        fontVariations: [
          ui.FontVariation('wght', weight.index * 100 + 100),
        ],
        color: color,
      );
}

abstract class AppStyle {
  AppStyle({
    required this.text,
    required this.errorText,
  });

  static AppStyle? _style;

  static set style(AppStyle val) => _style = val;

  static AppStyle get style {
    _style ??= AppStyleBase();
    return _style!;
  }

  final TextStyle text;
  final TextStyle errorText;

  TextStyle getTextStyle({
    required double size,
    required FontWeight weight,
    required Color color,
    String? fontFamily,
  });
}
