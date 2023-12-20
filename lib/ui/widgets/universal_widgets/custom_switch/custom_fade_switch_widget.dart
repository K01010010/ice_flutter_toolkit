import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ice_flutter_toolkit/utils/controllers/scroll_controller/custom_indexation_controller.dart';
import 'package:ice_flutter_toolkit/ui/widgets/universal_widgets/custom_switch/switch_decorator.dart';

class CustomFadeSwitchWidget extends StatefulWidget {
  final String firstWord;
  final String secondWord;
  final CustomIndexationController switchController;
  final AnimationController animator;
  final SwitchDecorator decorator;
  final void Function(int)? onSwitch;

  const CustomFadeSwitchWidget(
      {Key? key,
      required this.firstWord,
      required this.secondWord,
      required this.switchController,
      required this.animator,
      required this.decorator,
      this.onSwitch})
      : super(key: key);

  @override
  State<CustomFadeSwitchWidget> createState() => _CustomFadeSwitchWidgetState();
}

class _CustomFadeSwitchWidgetState extends State<CustomFadeSwitchWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.switchController.length = 2;
        widget.switchController.animateToPage ??= (page, {curve, duration}) =>
            widget.animator.animateTo(page,
                duration: duration ?? const Duration(milliseconds: 300),
                curve: curve ?? Curves.linear);
        widget.switchController.toNext();
        if (widget.onSwitch != null)
          widget.onSwitch!(widget.switchController.index);
      },
      child: Align(
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8),
        //   color: AppColors.transparent,
        // ),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => index == 1
                      ? SizedBox(width: widget.decorator.wordSpacing)
                      : Builder(builder: (context) {
                          return Container(
                            padding: widget.decorator.inactivePadding,
                            decoration: widget.decorator.inactiveBoxDecoration,
                            child: Text(
                              index == 0 ? widget.firstWord : widget.secondWord,
                              style: widget.decorator.inactiveStyle,
                            ),
                          );
                        }),
                ),
              ),
            ),
            Builder(builder: (_) {
              return Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        3,
                        (index) => index == 1
                            ? SizedBox(width: widget.decorator.wordSpacing)
                            : Observer(builder: (context) {
                                return AnimatedOpacity(
                                  opacity: index == 0
                                      ? 1.0 -
                                          widget.switchController.index
                                              .toDouble()
                                      : widget.switchController.index
                                          .toDouble(),
                                  duration: widget.switchController.duration,
                                  child: Container(
                                    padding: widget.decorator.activePadding,
                                    decoration:
                                        widget.decorator.activeBoxDecoration,
                                    child: Text(
                                      index == 0
                                          ? widget.firstWord
                                          : widget.secondWord,
                                      style: widget.decorator.activeStyle,
                                    ),
                                  ),
                                );
                              }),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
