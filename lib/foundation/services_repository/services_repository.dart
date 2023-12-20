import 'package:connection_notifier/connection_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:ice_flutter_toolkit/ui/pages/error_service_page/error_service.dart';

part 'services_repository.g.dart';

class ServicesRepository = ServicesRepositoryBase with _$ServicesRepository;

abstract class ServicesRepositoryBase with Store {
  ServicesRepositoryBase() {
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
