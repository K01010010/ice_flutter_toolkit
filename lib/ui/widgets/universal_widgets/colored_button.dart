import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/ui/widgets/universal_widgets/widget_data/box_data.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';
import 'package:ice_flutter_toolkit/utils/extensions.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    super.key,
    required this.textButton,
    this.textStyle,
    this.color,
    this.splashColor = AppColors.grayF2,
    this.height,
    this.width,
    this.borderRadius,
    this.boxData,
    this.border,
    this.margin,
    this.padding,
    this.child,
    this.splashEffect = true,
    this.onTap,
    this.useShadow = false,
    this.boxShadow,
  });

  final String textButton;
  final TextStyle? textStyle;

  final Color? color;
  final Color splashColor;

  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxData? boxData;
  final BoxBorder? border;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  final bool splashEffect;
  final void Function()? onTap;
  final bool useShadow;
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    return splashEffect
        ? Padding(
            padding: margin ?? EdgeInsets.zero,
            child: Ink(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: borderRadius ??
                    boxData?.radius ??
                    BorderRadius.circular(15),
                color: color ?? boxData?.fillColor,
                border: border ?? boxData?.border,
              ),
              child: InkWell(
                onTap: onTap,
                hoverColor: splashColor.withAlpha(128),
                focusColor: splashColor.withAlpha(128),
                highlightColor: splashColor.withAlpha(128),
                splashColor: splashColor.withAlpha(128),
                borderRadius: borderRadius ?? BorderRadius.circular(15),
                child: Padding(
                  padding: padding ??
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  child: child ??
                      Text(
                        textButton,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            TextStyleGet.get(
                              size: 18,
                              weight: FontWeight.w700,
                              color: AppColors.grayF2,
                            ),
                      ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: height,
              width: width,
              margin: margin,
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: borderRadius ??
                    boxData?.radius ??
                    BorderRadius.circular(15),
                color: color ?? boxData?.fillColor,
                border: border ?? boxData?.border,
                boxShadow: !useShadow
                    ? null
                    : [
                        boxShadow ??
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 3,
                              offset: const Offset(0, 0),
                            ),
                      ],
              ),
              child: child ??
                  Text(
                    textButton,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TextStyleGet.get(
                          size: 18,
                          weight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                  ),
            ),
          );
  }
}
