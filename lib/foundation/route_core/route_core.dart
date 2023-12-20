library core;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:ice_flutter_toolkit/api/api_config.dart';
import 'package:ice_flutter_toolkit/foundation/routes/app_router/app_router_base.dart';
import 'package:ice_flutter_toolkit/foundation/services_repository/services_repository.dart';

part 'route_core.g.dart';

part 'route_controller.dart';

part 'route_node.dart';

part 'repository_container.dart';

class RouteCore extends RouteCoreBase with _$RouteCore {
  static RouteCollection getRouteCollection(BuildContext ctx) =>
      AutoRouter.of(ctx).routeCollection;

  static RouteCore? _singleton;

  RouteCore._(RepositoryContainerBase repositoryContainer,
      {RouteCollection? routeCollection})
      : super(repositoryContainer, routeCollection);

  factory RouteCore.create(RepositoryContainerBase repositoryContainer,
      {RouteCollection? routeCollection}) {
    _singleton ??=
        RouteCore._(repositoryContainer, routeCollection: routeCollection);
    return _singleton!;
  }

  factory RouteCore.get() {
    _singleton ??= RouteCore.create(EmptyRepositoryContainer());
    return _singleton!;
  }
}

abstract class RouteCoreBase with Store {
  RouteCoreBase(RepositoryContainerBase? container, RouteCollection? routeCollection) {
    if (container != null) this.container = container;
    load(routeCollection);
  }

  @observable
  RepositoryContainerBase container = EmptyRepositoryContainer();
  @observable
  bool _loading = false;

  @computed
  get loading => container.loading || _loading;

  // final ApiConfig api = ApiConfig.get();
  // final ServicesRepository services = ServicesRepository();

  @observable
  RouteNode tree = RouteNode.create([], 0);

  Future<void> load(RouteCollection? routeCollection) async {
    _loading = true;
    var loading = container.initialize();

    var paths = routeCollection?.getPath() ?? [];
    for (var element in paths) {
      // ignore: avoid_print
      print('ice_flutter_toolkit: contain $element');
    }
    tree = RouteNode.create(paths, 0);

    await loading;

    _loading = false;
  }

// StackRouter? generalWrapperRouter;
}

extension PathOfRouteCollection on RouteCollection {
  List<String> getPath([String parentPath = ""]) {
    List<String> paths = [];
    for (var route in routes) {
      paths.add("$parentPath${route.path}");
      paths.addAll(route.children?.getPath("$parentPath${route.path}/") ?? []);
    }
    return paths;
  }
}
