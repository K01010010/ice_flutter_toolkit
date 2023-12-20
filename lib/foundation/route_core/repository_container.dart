
part of 'route_core.dart';

class EmptyRepositoryContainer extends RepositoryContainerBase {

  @override
  bool get loading {throw Exception("Не реализован RepositoryContainerBase и/или не передан в RouteCore");}

  @override
  Future<void> initialize() async {}
}
abstract class RepositoryContainerBase {
  bool get loading;
  Future<void> initialize();
}