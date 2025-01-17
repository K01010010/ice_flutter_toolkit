// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_flutter_toolkit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionRepository on ConnectionRepositoryBase, Store {
  late final _$loadingAtom =
      Atom(name: 'ConnectionRepositoryBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$connectedAtom =
      Atom(name: 'ConnectionRepositoryBase.connected', context: context);

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  late final _$_connectionAtom =
      Atom(name: 'ConnectionRepositoryBase._connection', context: context);

  @override
  ObservableStream<bool>? get _connection {
    _$_connectionAtom.reportRead();
    return super._connection;
  }

  @override
  set _connection(ObservableStream<bool>? value) {
    _$_connectionAtom.reportWrite(value, super._connection, () {
      super._connection = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('ConnectionRepositoryBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$ConnectionRepositoryBaseActionController =
      ActionController(name: 'ConnectionRepositoryBase', context: context);

  @override
  void _changeConnectionStatus(bool val) {
    final _$actionInfo = _$ConnectionRepositoryBaseActionController.startAction(
        name: 'ConnectionRepositoryBase._changeConnectionStatus');
    try {
      return super._changeConnectionStatus(val);
    } finally {
      _$ConnectionRepositoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
connected: ${connected}
    ''';
  }
}

mixin _$ErrorService on ErrorServiceBase, Store {
  late final _$showingDurationAtom =
      Atom(name: 'ErrorServiceBase.showingDuration', context: context);

  @override
  Duration? get showingDuration {
    _$showingDurationAtom.reportRead();
    return super.showingDuration;
  }

  @override
  set showingDuration(Duration? value) {
    _$showingDurationAtom.reportWrite(value, super.showingDuration, () {
      super.showingDuration = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'ErrorServiceBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$ErrorServiceBaseActionController =
      ActionController(name: 'ErrorServiceBase', context: context);

  @override
  void setErrorMessage(String? err, {Duration? showingTimer}) {
    final _$actionInfo = _$ErrorServiceBaseActionController.startAction(
        name: 'ErrorServiceBase.setErrorMessage');
    try {
      return super.setErrorMessage(err, showingTimer: showingTimer);
    } finally {
      _$ErrorServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showingDuration: ${showingDuration},
errorMessage: ${errorMessage}
    ''';
  }
}

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
  void _onHorizontalStart(ui.Offset gp) {
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

mixin _$CustomSearchTextFieldController
    on CustomSearchTextFieldControllerBase, Store {
  Computed<bool>? _$validatedComputed;

  @override
  bool get validated =>
      (_$validatedComputed ??= Computed<bool>(() => super.validated,
              name: 'CustomSearchTextFieldControllerBase.validated'))
          .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: 'CustomSearchTextFieldControllerBase.isEmpty'))
      .value;
  Computed<bool>? _$selectedComputed;

  @override
  bool get selected =>
      (_$selectedComputed ??= Computed<bool>(() => super.selected,
              name: 'CustomSearchTextFieldControllerBase.selected'))
          .value;

  late final _$errorMessageAtom = Atom(
      name: 'CustomSearchTextFieldControllerBase.errorMessage',
      context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$timerAtom =
      Atom(name: 'CustomSearchTextFieldControllerBase.timer', context: context);

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$lastSearchAtom = Atom(
      name: 'CustomSearchTextFieldControllerBase.lastSearch', context: context);

  @override
  String? get lastSearch {
    _$lastSearchAtom.reportRead();
    return super.lastSearch;
  }

  @override
  set lastSearch(String? value) {
    _$lastSearchAtom.reportWrite(value, super.lastSearch, () {
      super.lastSearch = value;
    });
  }

  late final _$selectedVariantAtom = Atom(
      name: 'CustomSearchTextFieldControllerBase.selectedVariant',
      context: context);

  @override
  SearchVariantResponse<dynamic>? get selectedVariant {
    _$selectedVariantAtom.reportRead();
    return super.selectedVariant;
  }

  @override
  set selectedVariant(SearchVariantResponse<dynamic>? value) {
    _$selectedVariantAtom.reportWrite(value, super.selectedVariant, () {
      super.selectedVariant = value;
    });
  }

  late final _$focusedAtom = Atom(
      name: 'CustomSearchTextFieldControllerBase.focused', context: context);

  @override
  bool get focused {
    _$focusedAtom.reportRead();
    return super.focused;
  }

  @override
  set focused(bool value) {
    _$focusedAtom.reportWrite(value, super.focused, () {
      super.focused = value;
    });
  }

  late final _$obscureAtom = Atom(
      name: 'CustomSearchTextFieldControllerBase.obscure', context: context);

  @override
  bool get obscure {
    _$obscureAtom.reportRead();
    return super.obscure;
  }

  @override
  set obscure(bool value) {
    _$obscureAtom.reportWrite(value, super.obscure, () {
      super.obscure = value;
    });
  }

  late final _$readOnlyAtom = Atom(
      name: 'CustomSearchTextFieldControllerBase.readOnly', context: context);

  @override
  bool get readOnly {
    _$readOnlyAtom.reportRead();
    return super.readOnly;
  }

  @override
  set readOnly(bool value) {
    _$readOnlyAtom.reportWrite(value, super.readOnly, () {
      super.readOnly = value;
    });
  }

  late final _$CustomSearchTextFieldControllerBaseActionController =
      ActionController(
          name: 'CustomSearchTextFieldControllerBase', context: context);

  @override
  void clear() {
    final _$actionInfo = _$CustomSearchTextFieldControllerBaseActionController
        .startAction(name: 'CustomSearchTextFieldControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateText(String str) {
    final _$actionInfo = _$CustomSearchTextFieldControllerBaseActionController
        .startAction(name: 'CustomSearchTextFieldControllerBase.updateText');
    try {
      return super.updateText(str);
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  bool validateWithIndex(String? text, int validator,
      {int? minLength, int? maxLength, String? startWith}) {
    final _$actionInfo =
        _$CustomSearchTextFieldControllerBaseActionController.startAction(
            name: 'CustomSearchTextFieldControllerBase.validateWithIndex');
    try {
      return super.validateWithIndex(text, validator,
          minLength: minLength, maxLength: maxLength, startWith: startWith);
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void pickVariant(int index) {
    final _$actionInfo = _$CustomSearchTextFieldControllerBaseActionController
        .startAction(name: 'CustomSearchTextFieldControllerBase.pickVariant');
    try {
      return super.pickVariant(index);
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeFocus([bool? val]) {
    final _$actionInfo = _$CustomSearchTextFieldControllerBaseActionController
        .startAction(name: 'CustomSearchTextFieldControllerBase.changeFocus');
    try {
      return super.changeFocus(val);
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void switchObscure([bool? val]) {
    final _$actionInfo = _$CustomSearchTextFieldControllerBaseActionController
        .startAction(name: 'CustomSearchTextFieldControllerBase.switchObscure');
    try {
      return super.switchObscure(val);
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void switchReadOnly([bool? val]) {
    final _$actionInfo =
        _$CustomSearchTextFieldControllerBaseActionController.startAction(
            name: 'CustomSearchTextFieldControllerBase.switchReadOnly');
    try {
      return super.switchReadOnly(val);
    } finally {
      _$CustomSearchTextFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
timer: ${timer},
lastSearch: ${lastSearch},
selectedVariant: ${selectedVariant},
focused: ${focused},
obscure: ${obscure},
readOnly: ${readOnly},
validated: ${validated},
isEmpty: ${isEmpty},
selected: ${selected}
    ''';
  }
}

mixin _$CustomTextFieldController on CustomTextFieldControllerBase, Store {
  Computed<bool>? _$validatedComputed;

  @override
  bool get validated =>
      (_$validatedComputed ??= Computed<bool>(() => super.validated,
              name: 'CustomTextFieldControllerBase.validated'))
          .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: 'CustomTextFieldControllerBase.isEmpty'))
      .value;
  Computed<bool>? _$passwordValidatedComputed;

  @override
  bool get passwordValidated => (_$passwordValidatedComputed ??= Computed<bool>(
          () => super.passwordValidated,
          name: 'CustomTextFieldControllerBase.passwordValidated'))
      .value;

  late final _$stateAtom =
      Atom(name: 'CustomTextFieldControllerBase.state', context: context);

  @override
  TextFieldState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(TextFieldState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: 'CustomTextFieldControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$oldTextAtom =
      Atom(name: 'CustomTextFieldControllerBase.oldText', context: context);

  @override
  String get oldText {
    _$oldTextAtom.reportRead();
    return super.oldText;
  }

  @override
  set oldText(String value) {
    _$oldTextAtom.reportWrite(value, super.oldText, () {
      super.oldText = value;
    });
  }

  late final _$textAtom =
      Atom(name: 'CustomTextFieldControllerBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$numberSymbolsAtom = Atom(
      name: 'CustomTextFieldControllerBase.numberSymbols', context: context);

  @override
  bool get numberSymbols {
    _$numberSymbolsAtom.reportRead();
    return super.numberSymbols;
  }

  @override
  set numberSymbols(bool value) {
    _$numberSymbolsAtom.reportWrite(value, super.numberSymbols, () {
      super.numberSymbols = value;
    });
  }

  late final _$capitalLettersNumbersAtom = Atom(
      name: 'CustomTextFieldControllerBase.capitalLettersNumbers',
      context: context);

  @override
  bool get capitalLettersNumbers {
    _$capitalLettersNumbersAtom.reportRead();
    return super.capitalLettersNumbers;
  }

  @override
  set capitalLettersNumbers(bool value) {
    _$capitalLettersNumbersAtom.reportWrite(value, super.capitalLettersNumbers,
        () {
      super.capitalLettersNumbers = value;
    });
  }

  late final _$specialSymbolsAtom = Atom(
      name: 'CustomTextFieldControllerBase.specialSymbols', context: context);

  @override
  bool get specialSymbols {
    _$specialSymbolsAtom.reportRead();
    return super.specialSymbols;
  }

  @override
  set specialSymbols(bool value) {
    _$specialSymbolsAtom.reportWrite(value, super.specialSymbols, () {
      super.specialSymbols = value;
    });
  }

  late final _$obscureAtom =
      Atom(name: 'CustomTextFieldControllerBase.obscure', context: context);

  @override
  bool get obscure {
    _$obscureAtom.reportRead();
    return super.obscure;
  }

  @override
  set obscure(bool value) {
    _$obscureAtom.reportWrite(value, super.obscure, () {
      super.obscure = value;
    });
  }

  late final _$readOnlyAtom =
      Atom(name: 'CustomTextFieldControllerBase.readOnly', context: context);

  @override
  bool get readOnly {
    _$readOnlyAtom.reportRead();
    return super.readOnly;
  }

  @override
  set readOnly(bool value) {
    _$readOnlyAtom.reportWrite(value, super.readOnly, () {
      super.readOnly = value;
    });
  }

  late final _$focusedAtom =
      Atom(name: 'CustomTextFieldControllerBase.focused', context: context);

  @override
  bool get focused {
    _$focusedAtom.reportRead();
    return super.focused;
  }

  @override
  set focused(bool value) {
    _$focusedAtom.reportWrite(value, super.focused, () {
      super.focused = value;
    });
  }

  late final _$CustomTextFieldControllerBaseActionController =
      ActionController(name: 'CustomTextFieldControllerBase', context: context);

  @override
  void updateText(String str) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.updateText');
    try {
      return super.updateText(str);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validate(ValidatorType validator,
      {String? text, int? minLength, int? maxLength, String? startWith}) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.validate');
    try {
      return super.validate(validator,
          text: text,
          minLength: minLength,
          maxLength: maxLength,
          startWith: startWith);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateWithIndex(String? text, int validator,
      {int? minLength, int? maxLength, String? startWith}) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.validateWithIndex');
    try {
      return super.validateWithIndex(text, validator,
          minLength: minLength, maxLength: maxLength, startWith: startWith);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchObscure([bool? val]) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.switchObscure');
    try {
      return super.switchObscure(val);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchReadOnly([bool? val]) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.switchReadOnly');
    try {
      return super.switchReadOnly(val);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFocus([bool? val]) {
    final _$actionInfo = _$CustomTextFieldControllerBaseActionController
        .startAction(name: 'CustomTextFieldControllerBase.changeFocus');
    try {
      return super.changeFocus(val);
    } finally {
      _$CustomTextFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage},
oldText: ${oldText},
text: ${text},
numberSymbols: ${numberSymbols},
capitalLettersNumbers: ${capitalLettersNumbers},
specialSymbols: ${specialSymbols},
obscure: ${obscure},
readOnly: ${readOnly},
focused: ${focused},
validated: ${validated},
isEmpty: ${isEmpty},
passwordValidated: ${passwordValidated}
    ''';
  }
}

mixin _$CustomDropdownController on CustomDropdownControllerBase, Store {
  Computed<bool>? _$validatedComputed;

  @override
  bool get validated =>
      (_$validatedComputed ??= Computed<bool>(() => super.validated,
              name: 'CustomDropdownControllerBase.validated'))
          .value;
  Computed<String>? _$currentVariantComputed;

  @override
  String get currentVariant =>
      (_$currentVariantComputed ??= Computed<String>(() => super.currentVariant,
              name: 'CustomDropdownControllerBase.currentVariant'))
          .value;

  late final _$indexContentAtom =
      Atom(name: 'CustomDropdownControllerBase.indexContent', context: context);

  @override
  int? get indexContent {
    _$indexContentAtom.reportRead();
    return super.indexContent;
  }

  @override
  set indexContent(int? value) {
    _$indexContentAtom.reportWrite(value, super.indexContent, () {
      super.indexContent = value;
    });
  }

  late final _$variantsAtom =
      Atom(name: 'CustomDropdownControllerBase.variants', context: context);

  @override
  ObservableList<String> get variants {
    _$variantsAtom.reportRead();
    return super.variants;
  }

  @override
  set variants(ObservableList<String> value) {
    _$variantsAtom.reportWrite(value, super.variants, () {
      super.variants = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'CustomDropdownControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$CustomDropdownControllerBaseActionController =
      ActionController(name: 'CustomDropdownControllerBase', context: context);

  @override
  dynamic setNewVariants(List<String> variants) {
    final _$actionInfo = _$CustomDropdownControllerBaseActionController
        .startAction(name: 'CustomDropdownControllerBase.setNewVariants');
    try {
      return super.setNewVariants(variants);
    } finally {
      _$CustomDropdownControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void turnNext({int? index}) {
    final _$actionInfo = _$CustomDropdownControllerBaseActionController
        .startAction(name: 'CustomDropdownControllerBase.turnNext');
    try {
      return super.turnNext(index: index);
    } finally {
      _$CustomDropdownControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validate() {
    final _$actionInfo = _$CustomDropdownControllerBaseActionController
        .startAction(name: 'CustomDropdownControllerBase.validate');
    try {
      return super.validate();
    } finally {
      _$CustomDropdownControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexContent: ${indexContent},
variants: ${variants},
errorMessage: ${errorMessage},
validated: ${validated},
currentVariant: ${currentVariant}
    ''';
  }
}

mixin _$CustomIndexationController on CustomIndexationControllerBase, Store {
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??= Computed<int>(() => super.length,
          name: 'CustomIndexationControllerBase.length'))
      .value;
  Computed<int>? _$indexComputed;

  @override
  int get index => (_$indexComputed ??= Computed<int>(() => super.index,
          name: 'CustomIndexationControllerBase.index'))
      .value;
  Computed<bool>? _$firstComputed;

  @override
  bool get first => (_$firstComputed ??= Computed<bool>(() => super.first,
          name: 'CustomIndexationControllerBase.first'))
      .value;
  Computed<bool>? _$secondComputed;

  @override
  bool get second => (_$secondComputed ??= Computed<bool>(() => super.second,
          name: 'CustomIndexationControllerBase.second'))
      .value;

  late final _$_lengthAtom =
      Atom(name: 'CustomIndexationControllerBase._length', context: context);

  @override
  int get _length {
    _$_lengthAtom.reportRead();
    return super._length;
  }

  @override
  set _length(int value) {
    _$_lengthAtom.reportWrite(value, super._length, () {
      super._length = value;
    });
  }

  late final _$_indexAtom =
      Atom(name: 'CustomIndexationControllerBase._index', context: context);

  @override
  int get _index {
    _$_indexAtom.reportRead();
    return super._index;
  }

  @override
  set _index(int value) {
    _$_indexAtom.reportWrite(value, super._index, () {
      super._index = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: 'CustomIndexationControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$CustomIndexationControllerBaseActionController =
      ActionController(
          name: 'CustomIndexationControllerBase', context: context);

  @override
  bool validate() {
    final _$actionInfo = _$CustomIndexationControllerBaseActionController
        .startAction(name: 'CustomIndexationControllerBase.validate');
    try {
      return super.validate();
    } finally {
      _$CustomIndexationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void turnTo({int? index, int? length, bool firstWhenOver = false}) {
    final _$actionInfo = _$CustomIndexationControllerBaseActionController
        .startAction(name: 'CustomIndexationControllerBase.turnTo');
    try {
      return super
          .turnTo(index: index, length: length, firstWhenOver: firstWhenOver);
    } finally {
      _$CustomIndexationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
length: ${length},
index: ${index},
first: ${first},
second: ${second}
    ''';
  }
}
