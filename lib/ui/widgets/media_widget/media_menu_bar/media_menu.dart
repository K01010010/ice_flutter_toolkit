import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/ice_flutter_toolkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaMenuBar extends StatefulWidget {
  const MediaMenuBar({
    super.key,
    this.pickCamera = true,
    this.pickGallery = true,

    required this.basicStyle,
    required this.textColor,
    required this.deleteColor,
    this.showSettingAlert,
    this.showPhotos,
    this.deleteHandler,
    this.deleteMiddleWord,
  });

  // Function(BuildContext) showPhotos;
  // Future<void> showPhotos(BuildContext ctx);
  final bool pickCamera;
  final bool pickGallery;
  final TextStyle basicStyle;
  final Color textColor;
  final Color deleteColor;

  // final Color cancelColor;
  final Function(BuildContext ctx)? showPhotos;
  final Function(BuildContext ctx)? deleteHandler;
  final Function(ImageSource source)? showSettingAlert;
  final String? deleteMiddleWord;

  Future<File?> pickPhoto(
    BuildContext context,
    Function(int index)? deleteHandler,
  ) =>
      showModalBottomSheet<File?>(
        isScrollControlled: true,
        context: context,
        backgroundColor: GrayColors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        builder: (context) => this,
      );

  @override
  State<MediaMenuBar> createState() => _MediaMenuBarState();
}

class _MediaMenuBarState extends State<MediaMenuBar> {
  bool waitingPermissionStatus = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () => AutoRouter.of(context).maybePop(),
                child: const SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ColoredBox(
                    color: GrayColors.transparent,
                  ),
                )),
          ),
          Container(
            width: size.width,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: GrayColors.black,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: GrayColors.gray1C,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ...[
                          if (widget.pickGallery)
                            _MediaButtonData('Open Gallery', widget.textColor,
                                () async {
                              if (waitingPermissionStatus) return;
                              File? file;

                              waitingPermissionStatus = true;
                              try {
                                XFile? data = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                file = data == null ? null : File(data.path);
                              } catch (e) {
                                var granted = await Permission
                                        .photos.isGranted ||
                                    await Permission.photos.request().isGranted;
                                if (!granted) {
                                  // ErrorService.get().setErrorMessage(
                                  //     "Ранее не было"
                                  //     " предоставлено разрешение к галерее. Т.к. повторный"
                                  //     " запрос невозможно осуществить, пройдите в"
                                  //     " настройки приложения, выдайте доступ и"
                                  //     " перезапустите приложение",
                                  //     showingTimer: const Duration(
                                  //         seconds: 3, milliseconds: 500));
                                  if (//Platform.isAndroid &&
                                      widget.showSettingAlert!=null) {
                                    await Future.delayed(
                                        const Duration(seconds: 4));


                                      widget.showSettingAlert!(ImageSource.gallery);
                                  }
                                  return;
                                }
                              }
                              waitingPermissionStatus = false;

                              if (context.mounted && file != null) {
                                AutoRouter.of(context).maybePop<File?>(file);
                              }
                            }),
                          if (widget.pickCamera)
                            _MediaButtonData('Make Photo', widget.textColor,
                                () async {
                              if (waitingPermissionStatus) return;

                              File? file;

                              waitingPermissionStatus = true;
                              try {
                                XFile? data = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                file = data == null ? null : File(data.path);
                              } catch (e) {
                                var granted = await Permission
                                        .camera.isGranted ||
                                    await Permission.camera.request().isGranted;
                                if (!granted) {
                                  // ErrorService.get().setErrorMessage(
                                  //     "Ранее не было"
                                  //     " предоставлено разрешение к камере. Т.к. повторный"
                                  //     " запрос невозможно осуществить, пройдите в"
                                  //     " настройки приложения, выдайте доступ и"
                                  //     " перезапустите приложение",
                                  //     showingTimer: const Duration(
                                  //         seconds: 3, milliseconds: 500));
                                  if (//Platform.isAndroid &&
                                      widget.showSettingAlert!=null) {
                                    await Future.delayed(
                                        const Duration(seconds: 4));

                                    if(widget.showSettingAlert!=null) {
                                      widget.showSettingAlert!(ImageSource.camera);
                                    }
                                  }

                                  return;
                                }
                              }
                              waitingPermissionStatus = false;

                              if (context.mounted && file != null) {
                                AutoRouter.of(context).maybePop<File?>(file);
                              }
                            }),
                          if (widget.showPhotos != null)
                            _MediaButtonData('Show Photo', widget.textColor, () {
                              widget.showPhotos!(context);
                              AutoRouter.of(context).maybePop();
                            }),
                          if (widget.deleteHandler != null)
                            _MediaButtonData(
                              'Delete${widget.deleteMiddleWord ?? " "}Photo',
                              widget.deleteColor,
                              () {
                                widget.deleteHandler!(context);
                                AutoRouter.of(context).maybePop();
                              },
                            ),
                        ].map(
                          (elem) => Column(
                            children: [
                              const Divider(color: GrayColors.gray37),
                              ColoredButton(
                                borderRadius: BorderRadius.circular(15),
                                splashEffect: false,
                                onTap: elem.onTap,
                                width: double.maxFinite,
                                title: elem.title,
                                titleStyle: widget.basicStyle
                                    .copyWith(color: elem.textColor),
                                color: GrayColors.gray1C,
                                shadow: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  ColoredButton(
                    borderRadius: BorderRadius.circular(15),
                    splashEffect: false,
                    onTap: () => AutoRouter.of(context).maybePop(null),
                    width: double.maxFinite,
                    title: 'Cancel',
                    titleStyle:
                        widget.basicStyle.copyWith(color: widget.textColor),
                    color: GrayColors.gray1C,
                    shadow: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  //
  // void showSettingAlert(String accessSubject) => DialogShower(
  //       title:
  //           "Если вы желаете получить доступ к $accessSubject, чтобы загрузить фото, то перейдите пожалуйста в настройки",
  //       themeColor: AppColors.purpleA517FE,
  //       gradientButton: AlertGradientButton(
  //         gradient: AppColors.meetsGradient,
  //         text: "Перейти в настройки",
  //         onTap: () {
  //           openAppSettings();
  //         },
  //       ),
  //       buttons: [
  //         AlertButton(
  //           text: "Отмена",
  //           outlined: false,
  //           onTap: () {
  //             Navigator.of(context, rootNavigator: true).pop();
  //           },
  //         )
  //       ],
  //     ).show(context);
}

class _MediaButtonData {
  final String title;
  final Color textColor;
  final void Function() onTap;

  _MediaButtonData(this.title, this.textColor, this.onTap);
}
