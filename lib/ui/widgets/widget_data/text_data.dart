part of '../../../ice_flutter_toolkit.dart';

class TextData {
  const TextData(
    this.text, this.style);
  // , {
    // this.textStyle,
    // required this.size,
    // this.weight = FontWeight.w400,
    // this.color = AppColors.gray12,
  // });

  final String text;

  final TextStyle style;
  // final double size;
  // final FontWeight weight;
  // final Color color;

  //
  // TextStyle get style =>
  //     textStyle ??
  //     AppStyle.style.getTextStyle(
  //       size: size,
  //       weight: weight,
  //       color: color,
  //     );

  // TextStyle getStyleWith(String fontFamily) => AppStyle.style.getTextStyle(
  //     size: size, weight: weight, color: color, fontFamily: fontFamily);
  //
  // factory TextData.w9(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w900,
  //       color: color,
  //     );
  //
  // factory TextData.w8(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w800,
  //       color: color,
  //     );
  //
  // factory TextData.w7(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w700,
  //       color: color,
  //     );
  //
  // factory TextData.w6(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w600,
  //       color: color,
  //     );
  //
  // factory TextData.w5(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w500,
  //       color: color,
  //     );
  //
  // factory TextData.w4(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w400,
  //       color: color,
  //     );
  //
  // factory TextData.w3(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w300,
  //       color: color,
  //     );
  //
  // factory TextData.w2(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w200,
  //       color: color,
  //     );
  //
  // factory TextData.w1(
  //   String text, {
  //   double size = 18,
  //   Color color = AppColors.gray12,
  // }) =>
  //     TextData(
  //       text,
  //       size: size,
  //       weight: FontWeight.w100,
  //       color: color,
  //     );
}
extension TextStyleExtension on TextStyle {
  //
  //
  // TextStyle getTextStyle({
  //   required double size,
  //   required FontWeight weight,
  //   required Color color,
  //   String? fontFamily,
  // });

  TextData wrap(String text) => TextData(text,this);
}