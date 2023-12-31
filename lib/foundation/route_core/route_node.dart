part of '../../ice_flutter_toolkit.dart';

class RouteNode {
  RouteNode({required this.paths, required this.rank, required this.name});

  //
  // factory RouteNode.createCollection(RouteCollection collection, int rank) {
  //
  //   for(var route in collection.routes) {
  //     route.path
  //   }
  //
  //   return RouteNode(paths:  MapEntry(
  //       key,
  //       value == null
  //           ? null
  //           : RouteNode.create(value, rank + 1, name: key))
  //       , rank: rank, name: name)
  // }
  factory RouteNode.create(List<String> subPath, int rank,
      {String? name}) {
    RouteNode emptyNode = RouteNode(paths: {}, rank: rank, name: name ?? "");
    if (subPath.isEmpty) return emptyNode;

    int slashIndex;
    // List<MapEntry<String,String>> nodes2 = subPath.map((s) {
    //
    //   slashIndex = s.indexOf("/");
    //   if (s == "") return const MapEntry("", "");
    //   if (slashIndex == -1) return MapEntry(s, "");
    //   String key = s.substring(0, slashIndex).trim();
    //   String value = s.substring(slashIndex + 1).trim();
    //
    //
    //   return MapEntry(key, value);
    // }).toList();

    String v1, v2;
    List<(String, String?)> resources = subPath.map((s) {
      slashIndex = s.indexOf("/");
      if (s == "") return ("", null);
      if (slashIndex == -1) return (s, null);

      // var key = s.substring(0, slashIndex).trim();

      // print("ROUTE_NODE : node NAME ${s.substring(0, slashIndex).trim()} and VAL ${s.substring(slashIndex + 1).trim()}");

      v1 = s.substring(0, slashIndex).trim();
      v2 = s.substring(slashIndex + 1).trim();
      if(name=="treeName"){
        print("v1 - $v1, v2 - $v2");
      }
      return (v1, v2);
    }).toList();
    // print("ROUTE_NODE will created with pairs: ");
    // res.forEach((element) {
    //   print("ROUTE_NODE : res result : keyName : ${element.$1} valPath : ${element.$2}");
    // });
    // print("and ROUTE_NODE will created with name $name, and rank $rank");
    if (resources.isEmpty) return emptyNode;

    //res.map((e) => e.$1).toSet() - ключи мапы, и по ним создается мапа с пустыми массивами, но если ключ '' то вместо пустого массива Нулл
    Map<String, List<String>?> nodes = {};
    for (var res in resources) {
      if ( //res.$2 != null &&
          nodes[res.$1] == null) {
        nodes[res.$1] = <String>[];
      }
      if (res.$2 != null) {
        nodes[res.$1]!.add(res.$2!);
      }
    }
    var paths = nodes.map((key, value) {
      return MapEntry(
        key,
        RouteNode.create(value ?? [], rank + 1, name: key),
      );
    });

    // nodes[]
    // = Map.fromEntries(resources
    //     .map((e) => e.$1).toSet()
    //     .map((e) => MapEntry(e, e == "" ? null : <String>[])));
    //
    // resources.sort((a, b) {
    //   return a.$1.compareTo(b.$1);
    // });
    //
    // for (var pair in resources) {
    //   nodes[pair.$1]?.add(pair.$2);
    // }

    // Map<String, RouteNode?> paths = nodes.map(
    //   (key, value) => MapEntry(
    //     key,
    //     value == null ? null : RouteNode.create(value, rank + 1, name: key),
    //   ),
    // );
    if(name == null) return paths.values.firstOrNull ?? emptyNode;

    var route = RouteNode(
      paths: paths,
      rank: rank,
      name: name,
    );
    return route;
  }

  final Map<String, RouteNode?> paths;
  final int rank;
  final String name;

  RouteController? service;

  T? getService<T extends RouteController>([String? path]) {
    path ??= AppRouterBase.singleton.fullForServices[T];

    if (path!.startsWith('/')) path = path.substring(1);
    var splits = path!.split('/');
    var node = getNodeTree(splits);

    print("PATH OF $T, is $path");
    return node.service != null ? (node.service as T) : null;
  }

  T setService<T extends RouteController>(T value, [String? path]) {
    path ??= AppRouterBase.singleton.fullForServices[T];

    if (path!.startsWith('/')) path = path.substring(1);
    var splits = path!.split('/');
    var node = getNodeTree(splits);

    node.service = value;
    return value;
  }

  RouteNode getNodeTree(List<String> splits) {
    if (splits.isEmpty) return this;
    if (paths.isEmpty) return this;
    if (splits.length == 1 && splits[0] == "") return this;

    if (!paths.containsKey(splits.first)) {
      print(
          "NodeTree with name $name haven't ${splits.first}, then I'm return myself");
      return this;
    }
    if (paths[splits.first] == null) {
      print(
          "NodeTree with name $name has null Node by key ${splits.first}, then I'm return myself");
      return this;
    }

    if (paths.length > 1) {
      return paths[splits.first]!.getNodeTree(splits.sublist(1));
    }
    return paths[splits.first]!;
  }

  @override
  String toString() {
    var list = paths
        .map((key, value) =>
            MapEntry(key, "PathEntry($key,${value?.toString()})"))
        .values
        .toList();
    var pathString = list.isEmpty
        ? ""
        : list.reduce((previousValue, element) => "$previousValue,$element");
    return "RouteNode($name,$rank,$pathString)";
  }
}
