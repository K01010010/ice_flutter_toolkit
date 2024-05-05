part of '../../ice_flutter_toolkit.dart';

class IceCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const IceCustomAppBar({
    super.key,
    required this.child,
    required this.toolbarHeight,
    this.backgroundColor,
    this.shadowColor,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight);
  final double toolbarHeight;
  final Widget child;
  final Color? backgroundColor;
  final Color? shadowColor;

  @override
  final Size preferredSize;

  @override
  IceCustomAppBarState createState() => IceCustomAppBarState();
}

class IceCustomAppBarState extends State<IceCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: widget.backgroundColor ?? GrayColors.white,
      shadowColor: widget.shadowColor ?? GrayColors.transparent,
      toolbarHeight: widget.toolbarHeight,
      flexibleSpace: widget.child,
    );
  }
}
