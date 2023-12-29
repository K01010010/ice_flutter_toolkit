part of '../../ice_flutter_toolkit.dart';

class ConnectionRepository = ConnectionRepositoryBase with _$ConnectionRepository;

abstract class ConnectionRepositoryBase with Store {
  ConnectionRepositoryBase() {
    load();
  }

  final ErrorService errorService = ErrorService.get();

  @action
  Future<void> load() async {
    loading = true;
    await ConnectionNotifierTools.initialize();
    _connection = ConnectionNotifierTools.onStatusChange.asObservable();
    _connection?.listen(_changeConnectionStatus);
    connected = ConnectionNotifierTools.isConnected;
    loading = false;
    // _changeConnectionStatus(ConnectionNotifierTools.isConnected);
  }

  @observable
  bool loading = false;
  @observable
  bool connected = false;
  @observable
  ObservableStream<bool>? _connection;

  @action
  void _changeConnectionStatus(bool val) {
    connected = val;
    if (!val) {
      errorService.setErrorMessage('Соединение потеряно',
          showingTimer: const Duration(milliseconds: 500));
    }
    // else {
    // errorService.setErrorMessage('Соединение восстановлено',
    //     showingTimer: const Duration(milliseconds: 500));
    // }
  }
}
