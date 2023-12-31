part of '../ice_flutter_toolkit.dart';

class AppStyleBase extends AppStyle {
  AppStyleBase() {
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

  @override
  TextStyle get errorText => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.errorText,
  );

  @override
  TextStyle get text => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.gray12, //.gray85,
  );
}

abstract class AppStyle {
  static AppStyle? _style;

  static set style(AppStyle val) => _style = val;

  static AppStyle get style {
    _style ??= AppStyleBase();
    return _style!;
  }

  TextStyle get text;

  TextStyle get errorText;

  TextStyle getTextStyle({
    required double size,
    required FontWeight weight,
    required Color color,
    String? fontFamily,
  });
}