import 'package:flutter/widgets.dart';

class FlexibleSizedBox extends StatelessWidget {
  const FlexibleSizedBox({super.key, this.height, this.width, this.flex, this.child});

  final Widget? child;
  final double? height;
  final double? width;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: ((flex ?? height ?? width ?? 10) / 10).round(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height ?? double.infinity,
          maxWidth: width ?? double.infinity,
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}

class ExpandedSizedBox extends StatelessWidget {
  const ExpandedSizedBox({super.key, this.height, this.width, this.flex, this.child});

  final Widget? child;
  final double? height;
  final double? width;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: ((flex ?? height ?? width ?? 10) / 10).round(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height ?? double.infinity,
          minWidth: width ?? double.infinity,
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
