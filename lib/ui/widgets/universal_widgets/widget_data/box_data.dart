import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';

class BoxData {
  const BoxData.box({
    this.fillColor,
    this.radius = BorderRadius.zero,
    required this.border,
    required this.side,
  });

  final Color? fillColor;
  final BoxBorder border;
  final BorderRadius radius;
  final BorderSide side;

  factory BoxData.r15All(
          {double width = 2,
          Color borderColor = AppColors.gray85,
          Color? fillColor}) =>
      BoxData.box(
        fillColor: fillColor,
        radius: BorderRadius.circular(15),
        side: BorderSide(color: borderColor, width: width),
        border: Border.all(
          width: width,
          color: borderColor,
        ),
      );

  factory BoxData.r20All(
          {double width = 2,
          Color borderColor = AppColors.gray85,
          Color? fillColor}) =>
      BoxData.box(
        fillColor: fillColor,
        radius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor, width: width),
        border: Border.all(
          width: width,
          color: borderColor,
        ),
      );
}
