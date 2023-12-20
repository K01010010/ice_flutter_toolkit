// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swiper_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SwiperController on SwiperControllerBase, Store {
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??= Computed<int>(() => super.length,
          name: 'SwiperControllerBase.length'))
      .value;
  Computed<bool>? _$firstComputed;

  @override
  bool get first => (_$firstComputed ??=
          Computed<bool>(() => super.first, name: 'SwiperControllerBase.first'))
      .value;
  Computed<bool>? _$secondComputed;

  @override
  bool get second => (_$secondComputed ??= Computed<bool>(() => super.second,
          name: 'SwiperControllerBase.second'))
      .value;
  Computed<String?>? _$errorMessageComputed;

  @override
  String? get errorMessage =>
      (_$errorMessageComputed ??= Computed<String?>(() => super.errorMessage,
              name: 'SwiperControllerBase.errorMessage'))
          .value;

  late final _$animationControllerAtom =
      Atom(name: 'SwiperControllerBase.animationController', context: context);

  @override
  AnimationController? get animationController {
    _$animationControllerAtom.reportRead();
    return super.animationController;
  }

  @override
  set animationController(AnimationController? value) {
    _$animationControllerAtom.reportWrite(value, super.animationController, () {
      super.animationController = value;
    });
  }

  late final _$animationAtom =
      Atom(name: 'SwiperControllerBase.animation', context: context);

  @override
  Animation<double>? get animation {
    _$animationAtom.reportRead();
    return super.animation;
  }

  @override
  set animation(Animation<double>? value) {
    _$animationAtom.reportWrite(value, super.animation, () {
      super.animation = value;
    });
  }

  late final _$SwiperControllerBaseActionController =
      ActionController(name: 'SwiperControllerBase', context: context);

  @override
  bool validate() {
    final _$actionInfo = _$SwiperControllerBaseActionController.startAction(
        name: 'SwiperControllerBase.validate');
    try {
      return super.validate();
    } finally {
      _$SwiperControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createAnimationController(
      TickerProvider pageTicker, double minimalOpacity) {
    final _$actionInfo = _$SwiperControllerBaseActionController.startAction(
        name: 'SwiperControllerBase.createAnimationController');
    try {
      return super.createAnimationController(pageTicker, minimalOpacity);
    } finally {
      _$SwiperControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animationController: ${animationController},
animation: ${animation},
length: ${length},
first: ${first},
second: ${second},
errorMessage: ${errorMessage}
    ''';
  }
}
