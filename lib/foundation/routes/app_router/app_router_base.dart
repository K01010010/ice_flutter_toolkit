import 'package:auto_route/auto_route.dart';

// @AutoRouterConfig(replaceInRouteName: 'Page,Route')
class EmptyRouter extends AppRouterBase {
  @override
  List<RouteInfo> get infoRoutes =>
      throw Exception("Не реализован AppRouterBase и/или не передан в синглтон");

}
abstract class AppRouterBase {

  static AppRouterBase? _singleton;
  static set singleton(AppRouterBase router) {
    _singleton = router;
  }
  static AppRouterBase get singleton {
    _singleton ??= EmptyRouter();
    return _singleton!;
  }

  //
  // RouteCore._(RepositoryContainerBase repositoryContainer, {RouteCollection? routeCollection})
  //     : super(repositoryContainer, routeCollection);
  //
  // factory RouteCore.create(RepositoryContainerBase repositoryContainer, {RouteCollection? routeCollection}) {
  //   _singleton ??= RouteCore._(repositoryContainer, routeCollection: routeCollection);
  //   return _singleton!;
  // }
  //
  // factory RouteCore.get() {
  //   _singleton ??= RouteCore.create(EmptyRepositoryContainer());
  //   return _singleton!;
  // }

  @override
  List<AutoRoute> get routes => infoRoutes.map((e) => e.route).toList();

  List<RouteInfo> get infoRoutes;
  static Map<Type, String>? _fullForServices;

  // set fullForServices(Map<Type, String> val) => _fullForServices = val;

  Map<Type, String> get fullForServices {
    _fullForServices ??= RouteInfo.controllerTypePaths(infoRoutes).asMap().map((key, value) => value);
    return _fullForServices!;
  }
}

class RouteInfo {
  final bool initial;
  final PageInfo<dynamic> page;
  final Type? controllerType;
  final String name;
  RouteInfo? parent;
  final List<RouteInfo>? children;

  RouteInfo({
    this.initial = false,
    required this.page,
    this.controllerType,
    required this.name,
    this.children,
  }) {
    children?.forEach((element) => element.parent = this);
  }

  ///like: general/home/
  String? get parentPath => parent == null
      ? null
      : (parent!.fullPath == '/' ? null : "${parent!.fullPath}/");

  String get fullPath => "${parentPath ?? ""}$name";

  CustomRoute get route => CustomRoute(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 400,
        initial: initial,
        page: page,
        path: name,
        children: children == null
            ? null
            : children!.map((info) => info.route).toList(),
      );

  static List<MapEntry<Type, String>> controllerTypePaths(
      List<RouteInfo> infoRoutes) {
    List<MapEntry<Type, String>> entries = [];
    for (var info in infoRoutes) {
      if (info.controllerType != null) {
        //print("Add entry : ${info.controllerType} : ${info.fullPath} - name is ${info.name} ");
        entries.add(MapEntry(info.controllerType!, info.fullPath));
      }
      if (info.children?.isNotEmpty ?? false) {
        entries.addAll(RouteInfo.controllerTypePaths(info.children!));
      }
    }
    return entries;
  }
}
