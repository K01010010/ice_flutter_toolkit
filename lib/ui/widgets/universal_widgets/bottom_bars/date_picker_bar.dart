import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';

class DatePickerBar extends StatefulWidget {
  const DatePickerBar(
      {super.key,
      required this.maxYear,
      required this.minYear,
      this.mode = CupertinoDatePickerMode.date});

  final int maxYear;
  final int minYear;
  final CupertinoDatePickerMode mode;

  static Future<DateTime?> pickDate(
    BuildContext context,
    int maxYear,
    int minYear, {
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) async {
    if (context.mounted) {
      return await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: AppColors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
          builder: (context) {
            return DatePickerBar(
              maxYear: maxYear,
              minYear: minYear,
              mode: mode,
            );
          });
    }
  }

  @override
  State<DatePickerBar> createState() => _DatePickerBarState();
}

class _DatePickerBarState extends State<DatePickerBar> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () => AutoRouter.of(context).pop(dateTime),
                child: const SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ColoredBox(
                    color: AppColors.transparent,
                  ),
                )),
          ),
          Container(
            height: 400,
            width: size.width,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            ),
            child: SafeArea(
              child: CupertinoDatePicker(
                minimumYear: widget.minYear,
                maximumYear: widget.maxYear,
                mode: widget.mode,
                onDateTimeChanged: (datetime) {
                  setState(() {
                    dateTime = datetime;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
