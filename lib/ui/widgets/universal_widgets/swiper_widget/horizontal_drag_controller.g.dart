// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horizontal_drag_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HorizontalDragController on HorizontalDragControllerBase, Store {
  Computed<double>? _$differenceComputed;

  @override
  double get difference =>
      (_$differenceComputed ??= Computed<double>(() => super.difference,
              name: 'HorizontalDragControllerBase.difference'))
          .value;

  late final _$controllerAtom =
      Atom(name: 'HorizontalDragControllerBase.controller', context: context);

  @override
  Observable<AnimationController?> get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(Observable<AnimationController?> value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$animationValueAtom = Atom(
      name: 'HorizontalDragControllerBase.animationValue', context: context);

  @override
  Animation<double>? get animationValue {
    _$animationValueAtom.reportRead();
    return super.animationValue;
  }

  @override
  set animationValue(Animation<double>? value) {
    _$animationValueAtom.reportWrite(value, super.animationValue, () {
      super.animationValue = value;
    });
  }

  late final _$_starterIndexAtom = Atom(
      name: 'HorizontalDragControllerBase._starterIndex', context: context);

  @override
  int get _starterIndex {
    _$_starterIndexAtom.reportRead();
    return super._starterIndex;
  }

  @override
  set _starterIndex(int value) {
    _$_starterIndexAtom.reportWrite(value, super._starterIndex, () {
      super._starterIndex = value;
    });
  }

  late final _$offsetStartAtom =
      Atom(name: 'HorizontalDragControllerBase.offsetStart', context: context);

  @override
  double get offsetStart {
    _$offsetStartAtom.reportRead();
    return super.offsetStart;
  }

  @override
  set offsetStart(double value) {
    _$offsetStartAtom.reportWrite(value, super.offsetStart, () {
      super.offsetStart = value;
    });
  }

  late final _$offsetEndAtom =
      Atom(name: 'HorizontalDragControllerBase.offsetEnd', context: context);

  @override
  double get offsetEnd {
    _$offsetEndAtom.reportRead();
    return super.offsetEnd;
  }

  @override
  set offsetEnd(double value) {
    _$offsetEndAtom.reportWrite(value, super.offsetEnd, () {
      super.offsetEnd = value;
    });
  }

  late final _$minimalOpacityAtom = Atom(
      name: 'HorizontalDragControllerBase.minimalOpacity', context: context);

  @override
  double get minimalOpacity {
    _$minimalOpacityAtom.reportRead();
    return super.minimalOpacity;
  }

  @override
  set minimalOpacity(double value) {
    _$minimalOpacityAtom.reportWrite(value, super.minimalOpacity, () {
      super.minimalOpacity = value;
    });
  }

  late final _$HorizontalDragControllerBaseActionController =
      ActionController(name: 'HorizontalDragControllerBase', context: context);

  @override
  void useAnimationControllerOf(
      AnimationController animationController, Animation<double> animation,
      {double? minimalOpacity}) {
    final _$actionInfo =
        _$HorizontalDragControllerBaseActionController.startAction(
            name: 'HorizontalDragControllerBase.useAnimationControllerOf');
    try {
      return super.useAnimationControllerOf(animationController, animation,
          minimalOpacity: minimalOpacity);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createAnimationController(TickerProvider pageTicker,
      {double? minimalOpacity}) {
    final _$actionInfo =
        _$HorizontalDragControllerBaseActionController.startAction(
            name: 'HorizontalDragControllerBase.createAnimationController');
    try {
      return super.createAnimationController(pageTicker,
          minimalOpacity: minimalOpacity);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragStart(DragStartDetails details) {
    final _$actionInfo =
        _$HorizontalDragControllerBaseActionController.startAction(
            name: 'HorizontalDragControllerBase.onHorizontalDragStart');
    try {
      return super.onHorizontalDragStart(details);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragDown(DragDownDetails details) {
    final _$actionInfo = _$HorizontalDragControllerBaseActionController
        .startAction(name: 'HorizontalDragControllerBase.onHorizontalDragDown');
    try {
      return super.onHorizontalDragDown(details);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onHorizontalStart(Offset gp) {
    final _$actionInfo = _$HorizontalDragControllerBaseActionController
        .startAction(name: 'HorizontalDragControllerBase._onHorizontalStart');
    try {
      return super._onHorizontalStart(gp);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragCancel() {
    final _$actionInfo =
        _$HorizontalDragControllerBaseActionController.startAction(
            name: 'HorizontalDragControllerBase.onHorizontalDragCancel');
    try {
      return super.onHorizontalDragCancel();
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    final _$actionInfo =
        _$HorizontalDragControllerBaseActionController.startAction(
            name: 'HorizontalDragControllerBase.onHorizontalDragUpdate');
    try {
      return super.onHorizontalDragUpdate(details);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDragEnd(DragEndDetails details) {
    final _$actionInfo = _$HorizontalDragControllerBaseActionController
        .startAction(name: 'HorizontalDragControllerBase.onHorizontalDragEnd');
    try {
      return super.onHorizontalDragEnd(details);
    } finally {
      _$HorizontalDragControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller},
animationValue: ${animationValue},
offsetStart: ${offsetStart},
offsetEnd: ${offsetEnd},
minimalOpacity: ${minimalOpacity},
difference: ${difference}
    ''';
  }
}
