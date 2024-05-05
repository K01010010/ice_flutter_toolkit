part of '../../ice_flutter_toolkit.dart';

class ColoredButton extends StatelessWidget {
  ColoredButton({
    super.key,
    this.height,
    this.width,
    this.splashEffect = true,
    this.splashColor,
    this.color,
    this.gradientColor = const [],
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.onTap,
    this.borderRadius,
    this.border,
    BoxData? box,
    this.maxLines,
    this.titleStyle,
    required this.title,
    this.child,
    this.paddingContent,
    this.marginWidget,
    required this.shadow,
    this.shadowColor,
    this.shadowBox,
    this.splashOpacity,
  }) : _box = box ?? AppStyle.style.coloredStyle.box;

  final Color? splashColor;
  final double? splashOpacity;
  final bool splashEffect;
  final Color? color;
  final List<Color> gradientColor;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  final double? height;
  final double? width;
  final void Function()? onTap;

  final BoxData _box;
  final BorderRadius? borderRadius;
  final BoxBorder? border;

  final String title;
  final TextStyle? titleStyle;
  final Widget? child;
  final int? maxLines;

  final EdgeInsets? paddingContent;
  final EdgeInsets? marginWidget;

  final bool shadow;
  final Color? shadowColor;
  final BoxShadow? shadowBox;

  CustomColoredButtonStyle get style => AppStyle.style.coloredStyle;

  @override
  Widget build(BuildContext context) {
    var decoration = BoxDecoration(
      borderRadius: borderRadius ?? _box.borderRadius,
      color: color ?? _box.fillColor,
      border: border ?? _box.border,
      gradient: gradientColor.isEmpty
          ? null
          : LinearGradient(
              begin: begin,
              end: end,
              colors: gradientColor,
            ),
      boxShadow: !shadow
          ? null
          : [
              shadowBox != null
                  ? shadowBox!
                  : shadowColor != null
                      ? BoxShadow(
                          color: shadowColor!, //.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: const Offset(0, 0),
                        )
                      : style.shadow,
            ],
    );

    return splashEffect
        ? Padding(
            padding: marginWidget ?? style.marginWidget,
            child: Ink(
              height: height,
              width: width,
              decoration: decoration,
              child: InkWell(
                onTap: onTap,
                hoverColor: (splashColor ?? style.splashColor)
                    .withOpacity(splashOpacity ?? 0.5),
                focusColor: (splashColor ?? style.splashColor)
                    .withOpacity(splashOpacity ?? 0.5),
                splashColor: (splashColor ?? style.splashColor)
                    .withOpacity(splashOpacity ?? 0.5),
                highlightColor: (splashColor ?? style.splashColor)
                    .withOpacity(splashOpacity ?? 0.5),
                borderRadius: borderRadius ?? _box.borderRadius,
                child: Padding(
                  padding: paddingContent ?? style.paddingContent,
                  child: child ??
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: maxLines,
                        style: titleStyle ?? style.titleStyle,
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
              margin: marginWidget ?? style.marginWidget,
              padding: paddingContent ?? style.paddingContent,
              decoration: decoration,
              child: child ??
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: maxLines,
                    style: titleStyle ?? style.titleStyle,
                  ),
            ),
          );
  }
}
