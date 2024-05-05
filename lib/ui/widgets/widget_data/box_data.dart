part of '../../../ice_flutter_toolkit.dart';

class BoxData {
  const BoxData._box({
    this.fillColor,
    required this.borderRadius,
    required this.radius,
    required this.border,
    required this.side,
  });

  final Color? fillColor;
  final BorderRadius borderRadius;
  final Radius radius;
  final BoxBorder? border;
  final BorderSide side;

  factory BoxData.r15All(
          {double width = 2,
          Color? borderColor,
          Color? fillColor}) =>
      BoxData.radiusAll(
        15,
        width: width,
        borderColor: borderColor,
        fillColor: fillColor,
      );

  factory BoxData.r20All(
          {double width = 2,
            Color? borderColor,
          Color? fillColor}) =>
      BoxData.radiusAll(
        20,
        width: width,
        borderColor: borderColor,
        fillColor: fillColor,
      );

  factory BoxData.radiusAll(
    double radius, {
    double width = 2,
    Color? borderColor,
    Color? fillColor,
  }) =>
      BoxData._box(
        fillColor: fillColor,
        borderRadius: BorderRadius.circular(radius),
        radius: Radius.circular(radius),
        side: borderColor == null
            ? BorderSide.none
            : BorderSide(color: borderColor, width: width),
        border: borderColor == null
            ? null
            : Border.all(color: borderColor, width: width),
      );
}
