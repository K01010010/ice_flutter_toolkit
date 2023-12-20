// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServicesRepository on ServicesRepositoryBase, Store {
  late final _$connectedAtom =
      Atom(name: 'ServicesRepositoryBase.connected', context: context);

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
      Atom(name: 'ServicesRepositoryBase._connection', context: context);

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
      AsyncAction('ServicesRepositoryBase.load', context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$ServicesRepositoryBaseActionController =
      ActionController(name: 'ServicesRepositoryBase', context: context);

  @override
  void _changeConnectionStatus(bool val) {
    final _$actionInfo = _$ServicesRepositoryBaseActionController.startAction(
        name: 'ServicesRepositoryBase._changeConnectionStatus');
    try {
      return super._changeConnectionStatus(val);
    } finally {
      _$ServicesRepositoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connected: ${connected}
    ''';
  }
}
