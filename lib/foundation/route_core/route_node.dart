part of 'route_core.dart';

class RouteNode {
  RouteNode({required this.paths, required this.rank, required this.name});

  factory RouteNode.create(List<String> subPath, int rank,
      {String name = "/"}) {
    RouteNode emptyNode = RouteNode(paths: {}, rank: rank, name: name);
    if (subPath.isEmpty) return emptyNode;

    int slashIndex;
    var res = subPath.map((s) {
      slashIndex = s.indexOf("/");
      if (s == "") return ("", "");
      if (slashIndex == -1) return (s, "");
      return (
        s.substring(0, slashIndex).trim(),
        s.substring(slashIndex + 1).trim()
      );
    }).toList();
    if (res.isEmpty) return emptyNode;

    //res.map((e) => e.$1).toSet() - ключи мапы, и по ним создается мапа с пустыми массивами, но если ключ '' то вместо пустого массива Нулл
    Map<String, List<String>?> nodes = Map.fromEntries(res
        .map((e) => e.$1)
        .toSet()
        .map((e) => MapEntry(e, e == "" ? null : <String>[])));

    res.sort((a, b) {
      return a.$1.compareTo(b.$1);
    });

    for (var pair in res) {
      nodes[pair.$1]?.add(pair.$2);
    }

    return RouteNode(
        paths: nodes.map((key, value) => MapEntry(
            key,
            value == null
                ? null
                : RouteNode.create(value, rank + 1, name: key))),
        rank: rank,
        name: name);
  }

  final Map<String, RouteNode?> paths;
  final int rank;
  final String name;

  RouteController? service;

  T? getService<T extends RouteController>([String? path]) {
    path ??= AppRouterBase.singleton.fullForServices[T];

    if (path!.startsWith('/')) path = path.substring(1);
    var splits = path.split('/');
    var node = getNodeTree(splits);

    print("PATH OF $T, is $path");
    return node.service != null ? (node.service as T) : null;
  }

  T setService<T extends RouteController>(T value, [String? path]) {
    path ??= AppRouterBase.singleton.fullForServices[T];

    if (path!.startsWith('/')) path = path.substring(1);
    var splits = path.split('/');
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
}
