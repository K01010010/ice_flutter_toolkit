// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

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
