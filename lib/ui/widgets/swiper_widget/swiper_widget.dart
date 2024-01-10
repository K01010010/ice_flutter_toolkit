part of '../../../ice_flutter_toolkit.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({
    super.key,
    required this.length,
    required this.itemBuilder,
    required this.previous,
    // required this.show,
    required this.next,
    required this.secondaryHeight,
    required this.secondaryWidth,
    required this.contentHeight,
    required this.contentWidth,
    required this.spacingHeight,
    required this.spacingWidth,
    required this.swiperController,
  });

  final SwiperController swiperController;
  final Widget Function(BuildContext, int, bool) itemBuilder;
  final int length;

  final double secondaryHeight;
  final double secondaryWidth;
  final double contentHeight;
  final double contentWidth;
  final double spacingHeight;
  final double spacingWidth;
  final Alignment previous;

  // final Alignment show;
  final Alignment next;

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    widget.swiperController.createAnimationController(this, 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: widget
          .swiperController.horizontalDragController.onHorizontalDragStart,
      onHorizontalDragEnd:
          widget.swiperController.horizontalDragController.onHorizontalDragEnd,
      onHorizontalDragUpdate: widget
          .swiperController.horizontalDragController.onHorizontalDragUpdate,
      onHorizontalDragCancel: widget
          .swiperController.horizontalDragController.onHorizontalDragCancel,
      onHorizontalDragDown:
          widget.swiperController.horizontalDragController.onHorizontalDragDown,
      // height: 200,
      // width: 300,
      child: ColoredBox(
        color: GrayColors.transparent,
        child: Observer(builder: (context) {
          if(widget.swiperController.scroller.length < 1) { return const SizedBox(); }
          if(widget.swiperController.scroller.length == 1) { return itemBuilder(0, context, show: true); }

          return Stack(children: [
            ...List.generate(
              widget.swiperController.scroller.index,
              // widget.length,
              // widget.mediaController.length,
              (index) => Builder(
                builder: (context) => itemBuilder(index, context, isLeft: true),
              ),
            ), //.reversed.toList(),
            ...List.generate(
              widget.swiperController.scroller.length - 1 - widget.swiperController.scroller.index,
              // widget.length,
              // widget.mediaController.length,
                  (index) => Builder(
                builder: (context) => itemBuilder(widget.swiperController.scroller.length - 1  - index, context, isLeft: false),
              ),
            ),//.reversed.toList(),
            Builder(
              builder: (context) => itemBuilder(
                widget.swiperController.scroller.index,
                context,
                show: true,
              ),
            ),
          ]);
        }),
      ),
    );
  }

  Widget itemBuilder(int index, BuildContext context,
      {bool show = false,bool isLeft = false}) {
    // var show = index == widget.swiperController.scroller.index;
    // var isLeft = index < widget.swiperController.scroller.index;
    //if (!show && index >= widget.swiperController.scroller.index) index++;

    var len = widget.swiperController.scroller.length - 1;


    var alignment = len < 1 ? Alignment.center : (show
            ? Alignment.lerp(widget.previous, widget.next,
                (index / (len < 1 ? 1 : len)).clamp(0, 1))
            : Alignment.lerp(
                // widget.previous, widget.next,
                isLeft ? widget.previous : Alignment.center,
                isLeft ? Alignment.center : widget.next,
        (index / (len < 1 ? 1 : len)).clamp(0, 1))) ??
        // ((index + (isLeft ? 0 : 1)) / (len < 1 ? 1 : len)).clamp(0, 1))) ??
        widget.previous;

    return SizedBox(
      height: widget.contentHeight + widget.spacingHeight,
      width: widget.contentWidth + widget.spacingWidth,
      child: AnimatedAlign(
        alignment: alignment,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: FadeTransition(
            opacity: widget
                    .swiperController.horizontalDragController.animationValue ??
                const AlwaysStoppedAnimation(1),
            child: SizedBox(
              height:
                  show ? widget.contentHeight : widget.secondaryHeight,
              width:
                  show ? widget.contentWidth : widget.secondaryWidth,
              child: Center(
                child: widget.itemBuilder(context, index, show),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
