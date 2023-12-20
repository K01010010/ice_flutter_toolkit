// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_indexation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

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
