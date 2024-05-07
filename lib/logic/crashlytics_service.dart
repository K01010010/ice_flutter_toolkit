part of '../ice_flutter_toolkit.dart';

abstract class CrashlyticsService {

  CrashlyticsService() {
    instance = this;
  }

  static CrashlyticsService? instance;

  void privateRecordError([dynamic err, StackTrace? st]);
  void privateLog(String msg, [String? debugTag]);

  static void recordError([dynamic err, StackTrace? st]) => instance?.privateRecordError(err, st);
  static void log(String msg, [String? debugTag]) => instance?.privateLog(msg, debugTag);
}