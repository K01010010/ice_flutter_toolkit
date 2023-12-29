part of '../../../ice_flutter_toolkit.dart';

class SwiperController extends SwiperControllerBase with _$SwiperController {
  SwiperController(super.scroller);
}

abstract class SwiperControllerBase with Store {
  SwiperControllerBase(this.scroller)
      : horizontalDragController = HorizontalDragController(scroller) {print("INITIALIZATION");}

  final CustomIndexationController scroller;
  final HorizontalDragController horizontalDragController;

  /// Length variable and property
  @computed
  int get length => scroller.length;

  set length(int val) => scroller.length = val;

  ///index varibale and property
  @computed
  bool get first => scroller.first;

  @computed
  bool get second => scroller.second;

  ///error region

  @computed
  String? get errorMessage => scroller.errorMessage;

  @action
  bool validate() => scroller.validate();

  @observable
  AnimationController? animationController;
  @observable
  Animation<double>? animation;

  @action
  void createAnimationController(TickerProvider pageTicker,double minimalOpacity) {
    const Duration animationDuration = Duration(milliseconds: 400);
    // controller.value = AnimationController(
    animationController = AnimationController(
      value: 1.0,
      duration: animationDuration,
      vsync: pageTicker,
    ); //..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeIn,
    );
    horizontalDragController.useAnimationControllerOf(
        animationController!, animation!, minimalOpacity: minimalOpacity);
  }
}
