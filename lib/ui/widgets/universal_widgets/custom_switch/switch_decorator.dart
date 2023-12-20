import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';
import 'package:ice_flutter_toolkit/utils/extensions.dart';

class SwitchDecorator {
  SwitchDecorator({
    required this.activeStyle,
    required this.inactiveStyle,
    required this.inactiveBoxDecoration,
    required this.activeBoxDecoration,
    required this.activePadding,
    required this.inactivePadding,
    required this.wordSpacing,
  });

  final TextStyle activeStyle;
  final TextStyle inactiveStyle;
  final Decoration inactiveBoxDecoration;
  final Decoration activeBoxDecoration;
  final EdgeInsets activePadding;
  final EdgeInsets inactivePadding;
  final double wordSpacing;

  factory SwitchDecorator.fromAppSwitchDecorator(Color themeColor) =>
      SwitchDecorator(
        activeStyle: TextStyleGet.get(
          size: 13,
          weight: FontWeight.w700,
          color: AppColors.white,
        ),
        inactiveStyle: TextStyleGet.get(
          size: 13,
          weight: FontWeight.w700,
          color: AppColors.gray12,
        ),
        inactiveBoxDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
            border: Border.all(color: themeColor, width: 2)),
        activeBoxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeColor,
          // border: Border.all(color: themeColor, width: 2)
        ),
        activePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        inactivePadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
        wordSpacing: 12,
      );
//TODO: rewrite
}
