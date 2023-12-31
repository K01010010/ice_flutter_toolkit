part of '../../ice_flutter_toolkit.dart';

abstract class RouteController {
  final RouteCore core = RouteCore.get();

  // ApiConfig get api => core.container.api;
  // ServicesRepository get services => core.container.services;
  StackRouter? router;

  // void setRouter(StackRouter router);

  String get path => AppRouterBase.singleton.fullForServices[runtimeType] ?? "";
  String get name => path.split('/').last;

  // static T? get<T extends RouteController>({RouteController Function()? delegate}) {
  //   if (delegate != null) {
  //     return AppCore.get().tree.setService<T>(delegate() as T);
  //   }
  //   return AppCore.get().tree.getService<T>();
  // }

  T getOrMe<T extends RouteController>({bool replaceNew = false}) {
    if (replaceNew) {
      _setService(this);
    } else {
      var service = RouteCore.get().tree.getService<T>();
      if (service != null) {
        return service;
      }
    }
    return this as T;
  }

  RouteController({StackRouter? router}) {
    var service = _getService();
    if (service == null) _setService();
    // service == null
    //     ? _setService()
    //     : copyServiceToMe();
  }

  navigateRoute([StackRouter? sRouter, useName = false]) =>
      (sRouter ?? router)?.navigateNamed(
          useName ? name : path);//(path.startsWith('/') ? path.substring(1) : path));

  // pushRoute([StackRouter? sRouter, useName = false]) =>
  //     (sRouter ?? router)?.pushNamed(
  //         useName ? name : (path.startsWith('/') ? path.substring(1) : path));
  //
  // replaceRoute([StackRouter? sRouter, useName = false]) =>
  //     (sRouter ?? router)?.replaceNamed(
  //         useName ? name : (path.startsWith('/') ? path.substring(1) : path));

  void _setService<T extends RouteController>([T? service]) =>
      core.tree.setService<T>(service ?? (this as T), path);

  T? _getService<T extends RouteController>() => core.tree.getService<T>(path);
}