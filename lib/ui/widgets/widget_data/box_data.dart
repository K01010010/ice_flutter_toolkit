part of '../../../ice_flutter_toolkit.dart';

class BoxData {
  const BoxData.box({
    this.fillColor,
    required this.borderRadius,
    required this.radius,
    required this.border,
    required this.side,
  });

  final Color? fillColor;
  final BoxBorder border;
  final BorderRadius borderRadius;
  final Radius radius;
  final BorderSide side;

  factory BoxData.r15All(
          {double width = 2,
          Color borderColor = const Color(0xFF858585),
          Color? fillColor}) =>
      BoxData.box(
        fillColor: fillColor,
        borderRadius: BorderRadius.circular(15),
        radius: const Radius.circular(15),
        side: BorderSide(color: borderColor, width: width),
        border: Border.all(
          width: width,
          color: borderColor,
        ),
      );

  factory BoxData.r20All(
          {double width = 2,
          Color borderColor = const Color(0xFF858585),
          Color? fillColor}) =>
      BoxData.box(
        fillColor: fillColor,
        borderRadius: BorderRadius.circular(20),
        radius: const Radius.circular(20),
        side: BorderSide(color: borderColor, width: width),
        border: Border.all(
          width: width,
          color: borderColor,
        ),
      );
}
