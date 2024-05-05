part of '../../ice_flutter_toolkit.dart';

class DateButton extends StatefulWidget {
  final Future<void> Function(BuildContext context) pickDateDelegate;
  final Observable<String?> dateError;
  final Observable<DateTime?> date;

  const DateButton({
    super.key,
    required this.pickDateDelegate,
    required this.dateError,
    required this.date,
  });

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  CustomDateButtonStyle get style => AppStyle.style.dateButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => widget.pickDateDelegate(context),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: style.radius,
            border: Border.all(
              color: widget.dateError.value != null
                  ? style.errorBorderColor
                  : style.borderColor,
              width: style.borderWidth,
            ),
          ),
          margin: style.margin,
          padding: style.padding,
          child: Text(
            widget.date.value != null
                ? widget.date.value!.describe(JustDateType.onlyDate)
                : "дд.мм.гг",
            style: style.dateStyle,
          ),
        ),
      );
    });
  }
}

class CustomDateButtonStyle {
  final BorderRadius radius; //BorderRadius.circular(15)
  final double borderWidth;
  final BorderStyle borderStyle;
  final Color borderColor; //AppColorsBase.get.grayE4
  final Color errorBorderColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final TextStyle dateStyle;

  CustomDateButtonStyle({
    required this.radius,
    required this.borderWidth,
    required this.borderStyle,
    required this.borderColor,
    required this.errorBorderColor,
    this.margin = EdgeInsets.zero,
    this.padding =
        const EdgeInsets.only(left: 20, right: 25, top: 18, bottom: 18),
    required this.dateStyle,
  }); // AppStyle.style.text,
}
