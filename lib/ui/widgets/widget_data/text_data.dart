part of '../../../ice_flutter_toolkit.dart';

class TextData {
  const TextData(this.text, this.style);

  final String text;
  final TextStyle style;

  factory TextData.w9(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w8(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w7(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w6(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w5(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w4(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w3(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w2(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: size,
              color: color,
            ),
      );

  factory TextData.w1(String text,
          {TextStyle? textStyle, double size = 18, Color? color}) =>
      TextData(
        text,
        textStyle ??
            TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: size,
              color: color,
            ),
      );
}

extension TextStyleExtension on TextStyle {
  TextData wrap(String text) => TextData(text, this);
}
