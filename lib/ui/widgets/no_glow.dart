part of '../../ice_flutter_toolkit.dart';

class NoGlowListWrapper extends StatelessWidget {
  const NoGlowListWrapper({
    super.key,
    required this.child,
  });

  final ListView child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlow(),
      child: child,
    );
  }
}

class NoGlowScrollingWidget extends StatelessWidget {
  const NoGlowScrollingWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlow(),
      child: child,
    );
  }
}

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
