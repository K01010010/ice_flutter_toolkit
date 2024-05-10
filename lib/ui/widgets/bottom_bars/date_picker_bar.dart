part of '../../../ice_flutter_toolkit.dart';

class DatePickerBar extends StatefulWidget {
  const DatePickerBar({
    super.key,
    required this.maxYear,
    required this.minYear,
    this.initialDate,
    this.mode = CupertinoDatePickerMode.date,
  });

  final DateTime? initialDate;
  final int maxYear;
  final int minYear;
  final CupertinoDatePickerMode mode;

  static Future<DateTime?> pickDate(
    BuildContext context,
    int maxYear,
    int minYear, {
    DateTime? initialDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  }) async {
    if (context.mounted) {
      return await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: GrayColors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
          builder: (context) {
            return DatePickerBar(
              initialDate: initialDate,
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
                    color: GrayColors.transparent,
                  ),
                )),
          ),
          Container(
            height: 400,
            width: size.width,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: GrayColors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            ),
            child: SafeArea(
              child: CupertinoDatePicker(
                initialDateTime: widget.initialDate,
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
