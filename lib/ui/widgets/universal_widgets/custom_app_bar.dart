import 'package:flutter/material.dart';
import 'package:ice_flutter_toolkit/utils/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.child,
    required this.toolbarHeight,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final double toolbarHeight;
  final Widget child;

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.transparent,
      toolbarHeight: widget.toolbarHeight,
      flexibleSpace: widget.child,
    );
  }
}
