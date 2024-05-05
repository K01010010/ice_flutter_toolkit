part of '../../ice_flutter_toolkit.dart';

class TitleCustomBar extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextStyle? titleStyle;

  final EdgeInsets? titlePadding;
  final EdgeInsets? paddingArrow;
  final EdgeInsets? marginArrow;

  final double heightSize;
  final bool shadow;
  final Color? shadowColor;
  final BoxShadow? shadowBox;
  final Widget? suffix;
  final Color? backgroundColor;

  const TitleCustomBar(
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
    this.heightSize = 50,
  });

  CustomAppBarStyle get style => AppStyle.style.appBarStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? style.arrowBarBackgroundColor,
        boxShadow: !shadow
            ? null
            : [
                shadowBox != null
                    ? shadowBox!
                    : shadowColor != null
                        ? BoxShadow(
                            color: backgroundColor ??
                                style.arrowBarBackgroundColor,
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
          onTap: () => AutoRouter.of(context).maybePop(),
          child: Container(
            color: backgroundColor,
            height: heightSize,
            // child: Center(
            //   child: !meetBackButton
            //       ? Icon(
            //     Icons.arrow_back,
            //     color: titleColor,
            //     size: 32,
            //   )
            //       : SvgPicture.asset(
            //     "assets/svg/back.svg",
            //     colorFilter: (titleColor ?? style.titleColor).filter,
            //   ),
            // ),

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
          width: heightSize,
          child: suffix ?? const SizedBox(),
        ),
      ]),
    );
  }
}

class ShadowTitleCustomBarWrapper extends StatelessWidget {
  const ShadowTitleCustomBarWrapper({
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
