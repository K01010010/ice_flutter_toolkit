// ignore_for_file: avoid_print

part of '../../../ice_flutter_toolkit.dart';

class ErrorService extends ErrorServiceBase with _$ErrorService {
  ErrorService._();

  static ErrorService? _singleton;

  factory ErrorService.get() {
    _singleton ??= ErrorService._();
    return _singleton!;
  }
}

abstract class ErrorServiceBase with Store {
  @observable
  Duration? showingDuration;
  @observable
  String? errorMessage;
  @action
  void setErrorMessage(String? err, {Duration? showingTimer}) {
    errorMessage = err;
    showingDuration = showingDuration;
  }
}