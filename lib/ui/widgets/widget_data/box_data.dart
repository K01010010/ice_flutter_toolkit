part of '../../../ice_flutter_toolkit.dart';

class BoxData {
  const BoxData._box({
    this.fillColor,
    required this.borderRadius,
    required this.radius,
    required this.border,
    required this.side,
  });

  final Color? fillColor;
  final BorderRadius borderRadius;
  final Radius radius;
  final BoxBorder? border;
  final BorderSide side;

  //
  // factory BoxData.r15All(
  //         {double width = 2,
  //         Color borderColor = const Color(0xFF858585),
  //         Color? fillColor}) =>
  //     BoxData.box(
  //       fillColor: fillColor,
  //       borderRadius: BorderRadius.circular(15),
  //       radius: const Radius.circular(15),
  //       side: BorderSide(color: borderColor, width: width),
  //       border: Border.all(
  //         width: width,
  //         color: borderColor,
  //       ),
  //     );

  factory BoxData.radiusAll({
    double radius = 20,
    double width = 2,
    Color? borderColor,
    Color? fillColor,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) =>
      BoxData._box(
        fillColor: fillColor,
        borderRadius: BorderRadius.circular(radius),
        radius: Radius.circular(radius),
        side: borderColor == null
            ? BorderSide.none
            : BorderSide(color: borderColor, width: width),
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor, width: width, strokeAlign: strokeAlign),
      );
}
