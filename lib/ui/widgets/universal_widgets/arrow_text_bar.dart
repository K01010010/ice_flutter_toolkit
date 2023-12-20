import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';
import 'package:ice_flutter_toolkit/utils/extensions.dart';

class ArrowTextBar extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final TextStyle? titleStyle;
  final bool shadow;
  final double? bottom;
  final Widget? suffix;
  final Color backgroundColor;

  const ArrowTextBar(this.title,
      {super.key,
      this.shadow = false,
      this.bottom,
      this.titleFontSize = 26,
      this.titleColor = AppColors.purpleA517FE,
      this.titleStyle,
      this.suffix,
      this.backgroundColor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: !shadow
            ? null
            : [
                BoxShadow(
                  color: backgroundColor,
                  blurRadius: 10,
                  spreadRadius: 25,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      padding: EdgeInsets.only(
        top: 20,
        left: 18,
        right: 18,
        bottom: bottom ?? 0,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Container(
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle ??
                    TextStyleGet.get(
                      size: titleFontSize,
                      weight: FontWeight.w700,
                      color: titleColor,
                    ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: suffix ?? const SizedBox(),
        ),
      ]),
    );
  }
}

class ShadowArrowTextBarWrapper extends StatelessWidget {
  const ShadowArrowTextBarWrapper(
      {super.key,
      required this.arrowTextBar,
      required this.child,
      this.paddingContentUnderBar = true,
      this.leftSafe = true,
      this.topSafe = true,
      this.rightSafe = true,
      this.bottomSafe = true,
      this.backgroundColor = AppColors.white});

  final bool leftSafe;
  final bool topSafe;
  final bool rightSafe;
  final bool bottomSafe;
  final ArrowTextBar arrowTextBar;
  final Widget child;
  final bool paddingContentUnderBar;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: [
        SafeArea(
          left: leftSafe,
          top: topSafe,
          right: rightSafe,
          bottom: bottomSafe,
          child: Padding(
            padding: EdgeInsets.only(top: paddingContentUnderBar ? 70 : 0),
            child: child,
          ),
        ),
        ColoredBox(
          color: backgroundColor,
          child: SafeArea(child: arrowTextBar),
        ),
      ]),
    );
  }
}
