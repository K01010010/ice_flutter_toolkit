import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'custom_indexation_controller.g.dart';

class CustomIndexationController extends CustomIndexationControllerBase
    with _$CustomIndexationController {
  CustomIndexationController({Duration duration = const Duration(milliseconds: 350), Curve curve = Curves.linear})
      : super(duration,curve);
}

abstract class CustomIndexationControllerBase with Store {
  CustomIndexationControllerBase(this.duration, this.curve);

  // final PageController pageController = PageController(initialPage: 0);
  final Duration duration;
  final Curve curve;

  /// Length variable and property
  @observable
  int _length = 2;

  @computed
  int get length => _length < 1 ? 1 : _length;
  set length(int len) => turnTo(index: _index, length: len);

  ///index varibale and property
  @observable
  int _index = 0;
  @computed
  int get index => _index;
  set index(int idx) => turnTo(index: idx, length: _length);

  @computed
  bool get first => _index == 0;

  @computed
  bool get second => _index == 1;

  ///error region
  @observable
  String? errorMessage;

  @action
  bool validate() {
    errorMessage = first ? "Должно быть отмечено" : null;
    return second;
  }

  ///pick method
  @action
  void turnTo({int? index, int? length, bool firstWhenOver = false}) {
    length ??= _length;
    _length = length;
    // length = clampLength;
    int current = _index;
    if (index != null) {
      _index = index;
    } else {
      _index++;
    }

    if (firstWhenOver && _index >= length) _index = 0;
    _index = _index.clamp(0, length < 1 ? 1 : length - 1);

    try {
      if ((_index - current).abs() <= 1) {
        if(animateToPage!=null) {
          animateToPage!(_index.toDouble(), duration: duration, curve: curve);
        }
      } else {
        if(jumpTo!=null) {
          jumpTo!(_index.toDouble());
        }
        else if(animateToPage!=null) {
          animateToPage!(_index.toDouble(), duration: duration, curve: curve);
        }
      }
    } catch (e) {}
  }

  // final PageController pageController = PageController(initialPage: 0);
  // @observable
  void Function(double page, {Duration? duration, Curve? curve})? animateToPage;
  // @observable
  void Function(double page)? jumpTo;

  void toNext() => turnTo(index: index + 1, firstWhenOver: true);
  void toLast() => turnTo(index: _length - 1);
  void toFirst() => turnTo(index: 0);

//Для проверки не выходит ли за край измененного массива индекс
// @action
// void updateOverflowIndexWith(int clampLength) {
//   // length = clampLength;
//   if (_index >= clampLength) {
//     _index = clampLength - 1;
//     pageController.animateToPage(_index,
//         duration: duration, curve: Curves.linear);
//   }
// }
}
