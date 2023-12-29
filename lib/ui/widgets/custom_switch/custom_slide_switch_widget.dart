part of '../../../ice_flutter_toolkit.dart';

class CustomSlideSwitchWidget extends StatefulWidget {
  final String firstWord;
  final String secondWord;
  final CustomIndexationController switchController;

  const CustomSlideSwitchWidget(
      {Key? key,
      required this.firstWord,
      required this.secondWord,
      required this.switchController})
      : super(key: key);

  @override
  State<CustomSlideSwitchWidget> createState() => _CustomSlideSwitchWidgetState();
}

class _CustomSlideSwitchWidgetState extends State<CustomSlideSwitchWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.switchController.length = 2;
        widget.switchController.animateToPage ??= (page, {curve, duration}) =>
            _controller.animateTo(page, duration: duration ?? const Duration(milliseconds: 300), curve: curve ?? Curves.linear);
        widget.switchController.toNext();
      },
      child: Container(
        height: 30,
        width: 200,
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.transparent,
        ),
        child: Stack(
          children: [
            Center(
              child: Row(children: [
                const SizedBox(width: 14),
                Text(
                  widget.firstWord,
                  style: const TextStyle(
                    fontFamily: 'Golos',
                    color: AppColors.gray817C7C,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.secondWord,
                  style: const TextStyle(
                    fontFamily: 'Golos',
                    color: AppColors.gray817C7C,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 14),
              ]),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(1.0, 0.0),
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
              )),
              child: Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF75532),
                      borderRadius: BorderRadius.circular(90)),
                  child: Center(
                    child: Observer(
                      builder: (context) {
                        return Text(
                          widget.switchController.first
                              ? widget.firstWord
                              : widget.secondWord,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                              color: AppColors.gray2F,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                          ),
                        );
                      }
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
