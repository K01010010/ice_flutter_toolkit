part of '../../ice_flutter_toolkit.dart';

class ArrowTextBar extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextStyle? titleStyle;

  final EdgeInsets? titlePadding;
  final EdgeInsets? paddingArrow;
  final EdgeInsets? marginArrow;

  final bool shadow;
  final Color? shadowColor;
  final BoxShadow? shadowBox;
  final Widget? suffix;
  final Color? backgroundColor;

  const ArrowTextBar(
    this.title, {
    super.key,
    this.titleColor,
    this.titleStyle,
    this.titlePadding,
    this.paddingArrow,
    this.marginArrow,
    this.shadow = false,
    this.shadowColor,
    this.shadowBox,
    this.suffix,
    this.backgroundColor,
  });

  CustomAppBarStyle get style => AppStyle.style.appBarStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? style.arrowBarBackgroundColor,
        boxShadow: !shadow
            ? null
            : [
                shadowBox != null
                    ? shadowBox!
                    : shadowColor != null
                        ? BoxShadow(
                            color: shadowColor!,
                            blurRadius: 10,
                            spreadRadius: 25,
                            offset: const Offset(0, 1),
                          )
                        : style.arrowBarShadow,
              ],
      ),
      padding: paddingArrow ?? style.paddingArrow,
      margin: marginArrow ?? style.marginArrow,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => AutoRouter.of(context).back(),
          child: SizedBox(
            width: 50,
            child: Align(
              alignment: Alignment.centerRight,
              child: AppStyle.style.getBackButton(
                backgroundColor ?? style.arrowBarBackgroundColor,
                titleColor ?? style.titleColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: titlePadding ?? style.titlePadding,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle ?? style.titleStyle,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          height: 32,
          child: suffix ?? const SizedBox(),
        ),
      ]),
    );
  }
}

class ShadowArrowTextBarWrapper extends StatelessWidget {
  const ShadowArrowTextBarWrapper({
    super.key,
    required this.arrowTextBar,
    required this.child,
    this.backgroundColor,
    this.leftSafe,
    this.topSafe,
    this.rightSafe,
    this.bottomSafe,
    this.offsetContentUnderBar,
  });

  final bool? leftSafe;
  final bool? topSafe;
  final bool? rightSafe;
  final bool? bottomSafe;

  final Widget arrowTextBar;
  final Widget child;
  final Color? backgroundColor;

  final double? offsetContentUnderBar;

  CustomAppBarStyle get style => AppStyle.style.appBarStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? style.arrowBarBackgroundColor,
      body: Stack(children: [
        SafeArea(
          left: leftSafe ?? style.leftSafe,
          top: topSafe ?? style.topSafe,
          right: rightSafe ?? style.rightSafe,
          bottom: bottomSafe ?? style.bottomSafe,
          child: Padding(
            padding: EdgeInsets.only(
                top: offsetContentUnderBar ?? style.offsetContentUnderBar),
            child: child,
          ),
        ),
        ColoredBox(
          color: backgroundColor ?? style.arrowBarBackgroundColor,
          child: SafeArea(child: arrowTextBar),
        ),
      ]),
    );
  }
}
