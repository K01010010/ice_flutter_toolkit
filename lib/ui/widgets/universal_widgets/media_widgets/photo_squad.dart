//
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:ice_flutter_toolkit/foundation/image_service/models/observable_asset_data/observable_asset_data.dart';
// import 'package:ice_flutter_toolkit/foundation/route_core/route_core.dart';
//
// class PhotoSquad extends StatelessWidget {
//   final ObservableAssetData asset;
//   final int index;
//
//   const PhotoSquad(
//       {super.key,
//         required this.asset,
//         required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     if(!asset.loaded) {
//       return const SizedBox();
//     }
//     return GestureDetector(
//       onTap: () async {
//         // var data = await asset.entity.originBytes;
//         var data = await asset.entity.originFile;
//         if (context.mounted) {
//           if(data!=null && RouteCore.get().image.pickPhotoCallback != null) {
//             RouteCore.get().image.pickPhotoCallback(data);
//             // AutoRouter.of(context).pop(data == null ? null : XFile.fromData(data));
//           }
//           AutoRouter.of(context).pop();
//         }
//       },
//       child: asset.item != null
//           ? asset.item!.getImage(fit: BoxFit.cover) //Image(image: asset.provider!, fit: BoxFit.cover)
//           : const Center(child: CircularProgressIndicator(),),
//     );
//   }
// }