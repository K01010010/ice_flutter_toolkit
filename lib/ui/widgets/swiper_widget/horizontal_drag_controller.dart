part of '../../../ice_flutter_toolkit.dart';

class HorizontalDragController = HorizontalDragControllerBase
    with _$HorizontalDragController;

abstract class HorizontalDragControllerBase extends RouteController with Store {
  HorizontalDragControllerBase(this.indexer);

  final CustomIndexationController indexer;


  @override
  Future<void> disposeController() {
    // TODO: implement disposeController
    throw UnimplementedError();
  }

  @override
  Future<void> initController() {
    // TODO: implement initController
    throw UnimplementedError();
  }


  @action
  void useAnimationControllerOf(
      AnimationController animationController, Animation<double> animation, {double? minimalOpacity}) {
    animationValue = animation;
    controller.value = animationController;
    minimalOpacity ??= this.minimalOpacity;
    this.minimalOpacity = minimalOpacity;
  }

  @action
  void createAnimationController(TickerProvider pageTicker, {double? minimalOpacity}) {
    controller.value = AnimationController(
      value: 1.0,
      duration: animationDuration,
      vsync: pageTicker,
    ); //..repeat(reverse: true);
    animationValue = CurvedAnimation(
      parent: controller.value!,
      curve: Curves.easeIn,
    );
    minimalOpacity ??= this.minimalOpacity;
    this.minimalOpacity = minimalOpacity;
  }

  final Duration animationDuration = const Duration(milliseconds: 400);

  @observable
  Observable<AnimationController?> controller = Observable(null);
  @observable
  Animation<double>? animationValue;

// @observable
// int index = 0;
  @observable
  int _starterIndex = 0;

  @computed
  double get difference => (offsetEnd - offsetStart).clamp(-150, 150);
  @observable
  double offsetStart = -1;
  @observable
  double offsetEnd = -1;

  @action
  void onHorizontalDragStart(DragStartDetails details) =>
      _onHorizontalStart(details.globalPosition);

  @action
  void onHorizontalDragDown(DragDownDetails details) =>
      _onHorizontalStart(details.globalPosition);

  @action
  void _onHorizontalStart(Offset gp) {
    offsetStart = gp.dx;
    offsetEnd = gp.dx;
    _starterIndex = indexer.index;

    //print('_onHorizontalStart >>>> index = ${indexer.index}, start $_starterIndex');
  }

  @action
  void onHorizontalDragCancel() {
    //print('onHorizontalDragCancel');
    offsetEnd = offsetStart;
    indexer.index = _starterIndex;
  }

  ///Дистанция необходимая для засчитанного перехода
  final pixelDistanceForSwipe = 150;

  ///Может принимать значения от 0 до 1.0. Нужно чтобы задать минимальный % прозрачности.
  ///То есть при minimalOpacity=0.5, при аннимационых Fade-переходах будет переход
  ///от 255 по альфа-каналу, до 128 - далее смена контента и от 128 до 255
  ///при minimalOpacity=0    от 255 до 0, далее смена от 0 до 255
  ///при minimalOpacity=0.33 от 255 до 85, далее смена от 85 до 255
  @observable
  double minimalOpacity = 0.6;

  @action
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    offsetEnd = details.globalPosition.dx;

    var halfPxDist = pixelDistanceForSwipe / 2;
    double val = 0.0;

    //print('onHorizontalDragUpdate <<<< difference $difference : index = ${indexer.index}, start $_starterIndex half $halfPxDist');
    //print('onHorizontalDragUpdate <<<< difference $difference : start = $offsetStart end $offsetEnd');

    if (difference > halfPxDist) {
      indexer.index = _starterIndex - 1;
      val = (difference.abs() - halfPxDist) / halfPxDist;
      val = ((1 - minimalOpacity) * val) + minimalOpacity;
    } else if (difference < -halfPxDist) {
      indexer.index = _starterIndex + 1;
      val = (difference.abs() - halfPxDist) / halfPxDist;
      val = ((1 - minimalOpacity) * val) + minimalOpacity;
    } else {
      indexer.index = _starterIndex;
      val = (halfPxDist - difference.abs()) / halfPxDist;
      val = ((1 - minimalOpacity) * val) + minimalOpacity;
    }
    if (_starterIndex == 0 && difference > 0) {
      val = 1;
    }
    if (_starterIndex == indexer.length - 1 && difference < 0) {
      val = 1;
    }
    controller.value?.value = val;

    //print('onHorizontalDragUpdate >>>> difference $difference : index = ${indexer.index}, start $_starterIndex');
    // controller?.animateTo(val);
    //index = index.clamp(0, indexer.length - 1);
  }

  @action
  void onHorizontalDragEnd(DragEndDetails details) {
    // if ((controller?.value ?? 1.0) > 0.9) controller?.value = minimalOpacity;
    //print('onHorizontalDragEnd <<<< index = ${indexer.index}, start $_starterIndex');
    controller.value?.animateTo(1.0);
    var halfPxDist = pixelDistanceForSwipe / 2;
    if (difference > halfPxDist) {
      indexer.index = _starterIndex - 1;
    } else if (difference < -halfPxDist) {
      indexer.index = _starterIndex + 1;
    } else {
      indexer.index = _starterIndex;
    }
    // index = index.clamp(0, content.length - 1);
    _starterIndex = indexer.index;

    //print('onHorizontalDragEnd >>>> index = ${indexer.index}, start $_starterIndex');
  }

}
