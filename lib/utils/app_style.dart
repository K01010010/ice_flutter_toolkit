part of '../ice_flutter_toolkit.dart';

class AppStyleBase extends AppStyle {
  AppStyleBase() {
    throw UnimplementedError("Не установлен стиль приложения");
  }

  @override
  TextStyle get errorText => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColorsBase.get.errorText,
      );

  @override
  TextStyle get text => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColorsBase.get.black,
      );

  AppColorsBase colors = const AppColorsBase();

  @override
  getBackButton(Color backgroundColor, Color titleColor) => Container(
        color: backgroundColor,
        width: 32,
        height: 32,
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: titleColor,
            size: 32,
          ),
        ),
      );

  @override
  CustomFieldStyle get fieldStyle =>
      throw UnimplementedError("Style should be define");
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

  CustomFieldStyle get fieldStyle;

  CustomDateButtonStyle get dateButtonStyle;

  CustomAppBarStyle get appBarStyle;

  CustomColoredButtonStyle get coloredStyle;

  getBackButton(Color backgroundColor, Color titleColor);
}

class CustomColoredButtonStyle {
  CustomColoredButtonStyle({
    required this.splashColor, //= AppColorsBase.grayF2,
    required this.titleStyle,
    required this.paddingContent,
    required this.marginWidget,
    required this.box,
    required this.shadow,
  });

  final Color splashColor;
  final TextStyle titleStyle;
  final EdgeInsets paddingContent;
  final EdgeInsets marginWidget;
  final BoxData box;
  final BoxShadow shadow;
}

class CustomAppBarStyle {
  final Color barBackgroundColor;
  final Color barShadowColor;

  final Color arrowBarBackgroundColor;
  final BoxShadow arrowBarShadow;
  final EdgeInsets paddingArrow;
  final EdgeInsets marginArrow;
  final EdgeInsets titlePadding;

  final TextStyle titleStyle;
  final Color titleColor;

  final bool leftSafe;
  final bool topSafe;
  final bool rightSafe;
  final bool bottomSafe;
  final double offsetContentUnderBar;

  CustomAppBarStyle({
    required this.barBackgroundColor,
    required this.barShadowColor,
    required this.arrowBarBackgroundColor,
    required this.arrowBarShadow,
    required this.paddingArrow,
    required this.marginArrow,
    required this.titlePadding,
    required this.titleStyle,
    required this.titleColor,
    this.leftSafe = true,
    this.topSafe = true,
    this.rightSafe = true,
    this.bottomSafe = true,
    this.offsetContentUnderBar = 70,
  });
}

class CustomFieldStyle {
  CustomFieldStyle({
    required this.titleOffset,
    required this.title,
    required this.text,
    required this.hint,
    required this.error,
    required this.box,
    required this.errorBox,
    required this.contentPadding,
    required this.widgetMargin,
    required this.suffixWidgetColor,
  });

  final double titleOffset;
  final TextStyle title; //TextData
  final TextStyle text; //TextData
  final TextStyle hint; //TextData
  final TextStyle error; //TextData
  // fillColor// ?? AppColors.white
  final BoxData box;
  final BoxData errorBox;

  final EdgeInsets contentPadding;
  final EdgeInsets widgetMargin;
  final Color suffixWidgetColor;
}
