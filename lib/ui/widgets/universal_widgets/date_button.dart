import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';
import 'package:ice_flutter_toolkit/utils/extensions.dart';

class DateButton extends StatefulWidget {
  final Future<void> Function(BuildContext context) pickDateDelegate;
  final Observable<String?> dateError;
  final Observable<DateTime?> date;

  const DateButton(
      {super.key,
      required this.pickDateDelegate,
      required this.dateError,
      required this.date});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => widget.pickDateDelegate(context),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: widget.dateError.value != null
                      ? AppColors.errorText
                      : AppColors.grayE4E3E3,
                  width: 2)),
          // margin: padding,
          padding:
              const EdgeInsets.only(left: 20, right: 25, top: 18, bottom: 18),
          child: Text(
            widget.date.value != null ?
            widget.date.value!.describe(JustDateType.onlyDate)
                : "дд.мм.гг",
            style: TextStyleGet.get(
              size: 18,
              weight: FontWeight.w500,
              color: widget.date.value == null ? AppColors.gray85 : AppColors.gray12,
            ),
          ),
        ),
      );
    });
  }
}
