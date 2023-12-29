part of '../../../ice_flutter_toolkit.dart';

class MediaItem extends _MediaItemBase {
  // ignore: library_private_types_in_public_api
  final _MediaItemBase item;

  MediaItem._(this.item);

  // ignore: library_private_types_in_public_api
  factory MediaItem.withBasic(_MediaItemBase base) => MediaItem._(base);

  factory MediaItem.bytes(Uint8List bytes) => MediaItem._(ByteMediaItem(bytes));
  factory MediaItem.url(String url) => MediaItem._(UrlMediaItem(url));
  factory MediaItem.png(String name) => MediaItem._(AssetMediaItem(name));

  @override
  Widget getImage({BoxFit? fit, double? height}) =>
      item.getImage(fit: fit, height: height);

  @override
  ImageProvider<Object> getProvider() => item.getProvider();

  factory MediaItem.fromRawJson(String str) =>
      MediaItem.fromJson(jsonDecode(str));

  String toRawJson() => jsonEncode(toJson());

  factory MediaItem.fromJson(Map<dynamic, dynamic> json) =>
      MediaItem._(
        json.containsKey('url')
            ? UrlMediaItem.fromJson(json)
            : (json.containsKey('path')
            ? AssetMediaItem.fromJson(json)
            : ByteMediaItem.fromJson(json)),
      );

  @override
  Map<String, dynamic> toJson() => item.toJson();
}

class AssetMediaItem extends _MediaItemBase {
  final String namePng;

  AssetMediaItem(this.namePng);

  @override
  Widget getImage({BoxFit? fit, double? height}) => Image.asset(
      'assets/png/$namePng.png',
      height: height,
      width: double.maxFinite,
      fit: fit,
    );

  @override
  ImageProvider<Object> getProvider() => AssetImage('assets/png/$namePng.png');

  @override
  Map<String, dynamic> toJson() => {"path": namePng};

  factory AssetMediaItem.fromJson(Map<dynamic, dynamic> json) =>
      AssetMediaItem(json["path"]);
}

class ByteMediaItem extends _MediaItemBase {
  final Uint8List bytes;

  ByteMediaItem(this.bytes);

  @override
  Widget getImage({BoxFit? fit, double? height}) => Image.memory(
      bytes,
      height: height,
      width: double.maxFinite,
      fit: fit,
    );

  @override
  ImageProvider<Object> getProvider() => MemoryImage(bytes);

  @override
  Map<String, dynamic> toJson() => {"bytes": List<dynamic>.from(bytes.map((x) => x))};

  // bytes: Uint8List.fromList(json["bytes"] == null ? [] : List<int>.from(json["bytes"]!.map((x) => x))),
  factory ByteMediaItem.fromJson(Map<dynamic, dynamic> json) =>
      ByteMediaItem(
        Uint8List.fromList(json["bytes"] == null
            ? []
            : List<int>.from(json["bytes"]!.map((x) => x)),
        ),
      );
}

class UrlMediaItem extends _MediaItemBase {
  final String url;

  UrlMediaItem(this.url);

  @override
  Widget getImage({BoxFit? fit, double? height}) => CachedNetworkImage(
        height: height, width: double.maxFinite, imageUrl: fullUrl, fit: fit);

  String get fullUrl => "${RouteCore.get().container.imageUrl}/$url";

  @override
  Map<String, dynamic> toJson() => {"url": url};

  factory UrlMediaItem.fromJson(Map<dynamic, dynamic> json) => UrlMediaItem(json["url"]);

  @override
  ImageProvider<Object> getProvider() => CachedNetworkImageProvider(fullUrl);
}

abstract class _MediaItemBase {
  Widget getImage({BoxFit? fit, double? height});

  Map<String, dynamic> toJson();

  ImageProvider<Object> getProvider();
}
