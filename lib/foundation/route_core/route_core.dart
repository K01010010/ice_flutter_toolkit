// part of '../../ice_flutter_toolkit.dart';
//
// class RouteCore extends RouteCoreBase with _$RouteCore {
//   static RouteCollection getRouteCollection(BuildContext ctx) =>
//       AutoRouter.of(ctx).routeCollection;
//
//   static RouteCore? _singleton;
//
//   RouteCore._(RepositoryContainerBase repositoryContainer,
//       {RouteCollection? routeCollection})
//       : super(repositoryContainer, routeCollection);
//
//   factory RouteCore.create(RepositoryContainerBase repositoryContainer,
//       {RouteCollection? routeCollection}) {
//     _singleton ??=
//         RouteCore._(repositoryContainer, routeCollection: routeCollection);
//     return _singleton!;
//   }
//
//   factory RouteCore.get() {
//     _singleton ??= RouteCore.create(EmptyRepositoryContainer());
//     return _singleton!;
//   }
// }
//
// abstract class RouteCoreBase with Store {
//   RouteCoreBase(
//       RepositoryContainerBase? container, RouteCollection? routeCollection) {
//     if (container != null) this.container = container;
//     load(routeCollection);
//   }
//
//   @observable
//   String imageUrl = "";
//
//   @observable
//   RepositoryContainerBase container = EmptyRepositoryContainer();
//   @observable
//   bool _loading = false;
//
//   @computed
//   get loading => container.loading || _loading;
//
//   // final ApiConfig api = ApiConfig.get();
//   // final ServicesRepository services = ServicesRepository();
//
//   @observable
//   RouteNode tree = RouteNode.create([], 0);
//
//   Future<void> load(RouteCollection? routeCollection) async {
//     _loading = true;
//     var loading = container.initialize();
//
//     var paths = routeCollection?.getPath() ?? [];
//     for (var element in paths) {
//       // ignore: avoid_print
//       print('ice_flutter_toolkit: $element');
//     }
//     tree = RouteNode.create(paths, 0);
//     // print("TREE NODE DEBUG_TAG : created route : "); // tree.toString().printFull();
//     await loading;
//     imageUrl = container.imageUrl;
//
//     _loading = false;
//   }
// }
//
// extension PathOfRouteCollection on RouteCollection {
//   List<String> getPath([String? parent]) {
//
//     List<String> paths = [];
//     for (var route in routes) {
//
//       String fullPath = route.path;
//       if (parent != null) {
//         fullPath = parent.endsWith('/')
//           ? "${parent ?? ""}${route.path}"
//           : "${parent ?? ""}/${route.path}";
//       }
//
//       paths.add(fullPath);
//       paths.addAll(route.children?.getPath(fullPath) ?? []);
//     }
//     return paths;
//   }
// }