part of '../../../ice_flutter_toolkit.dart';

// @AutoRouterConfig(replaceInRouteName: 'Page,Route')
// class EmptyRouter extends AppRouterBase {
//   @override
//   List<RouteInfo> get infoRoutes => throw Exception(
//       "Не реализован AppRouterBase и/или не передан в синглтон");
// }
//
// mixin class AppRouterBase implements RootStackRouter {
//   static AppRouterBase? _singleton;
//
//   static set singleton(AppRouterBase router) {
//     _singleton = router;
//   }
//
//   static AppRouterBase get singleton {
//     _singleton ??= EmptyRouter();
//     return _singleton!;
//   }
//
//   @override
//   List<AutoRoute> get routes => infoRoutes.map((e) => e.route).toList();
//
//   List<RouteInfo> get infoRoutes;
//
//   Map<Type, String>? _fullForServices;
//
//   // set fullForServices(Map<Type, String> val) => _fullForServices = val;
//
//   Map<Type, String> get fullForServices {
//     _fullForServices ??= RouteInfo.controllerTypePaths(infoRoutes)
//         .asMap()
//         .map((key, value) => value);
//     return _fullForServices!;
//   }
//
//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }

// class RouteInfo {
//   final bool initial;
//   final PageInfo<dynamic> page;
//   final Type? controllerType;
//   final String name;
//   RouteInfo? parent;
//   final List<RouteInfo>? children;
//
//   RouteInfo({
//     this.initial = false,
//     required this.page,
//     this.controllerType,
//     required this.name,
//     this.children,
//   }) {
//     children?.forEach((element) => element.parent = this);
//   }
//
//   ///like: general/home/
//   String? get parentPath => parent?.fullPath;
//   String get fullPath {
//     String? parent = parentPath;
//     if (parent == null) return name;
//
//     return parent.endsWith('/')
//         ? "${parentPath ?? ""}$name"
//         : "${parentPath ?? ""}/$name";
//   }
//
//   CustomRoute get route => CustomRoute(
//         transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
//         durationInMilliseconds: 400,
//         initial: initial,
//         page: page,
//         path: name,
//         children: children?.map((info) => info.route).toList(),
//       );
//
//   static List<MapEntry<Type, String>> controllerTypePaths(
//       List<RouteInfo> infoRoutes) {
//     List<MapEntry<Type, String>> entries = [];
//     for (var info in infoRoutes) {
//       if (info.controllerType != null) {
//         entries.add(MapEntry(info.controllerType!, info.fullPath));
//       }
//       if (info.children?.isNotEmpty ?? false) {
//         entries.addAll(RouteInfo.controllerTypePaths(info.children!));
//       }
//     }
//     return entries;
//   }
// }
