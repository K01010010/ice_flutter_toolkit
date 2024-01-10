part of '../../ice_flutter_toolkit.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
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
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: widget.backgroundColor ?? AppColorsBase.get.white,
      shadowColor: widget.shadowColor ?? AppColorsBase.get.transparent,
      toolbarHeight: widget.toolbarHeight,
      flexibleSpace: widget.child,
    );
  }
}
