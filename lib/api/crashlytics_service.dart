
// class EmptyCrashlyticsService extends CrashlyticsService {
//
// }
abstract class CrashlyticsService {

  CrashlyticsService() {
    instance = this;
  }

  static late CrashlyticsService instance;

  void _recordError([dynamic err, StackTrace? st]);
  void _log(String msg, [String? debugTag]);

  static void recordError([dynamic err, StackTrace? st]) => instance._recordError(err, st);
  static void log(String msg, [String? debugTag]) => instance._log(msg, debugTag);
}