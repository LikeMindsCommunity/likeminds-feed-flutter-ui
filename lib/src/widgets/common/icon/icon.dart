import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

enum LMIconType { icon, svg, png }

class LMIcon extends StatelessWidget {
  final LMIconType type;
  final IconData? icon;
  // path to svg or png/jpeg
  final String? assetPath;
  // not required if the type is png
  final Color? color;
  final double? size;
  final double? boxSize;
  final double? boxBorder;
  final double? boxBorderRadius;
  final double? boxPadding;
  final Color? backgroundColor;
  final BoxFit? fit;

  const LMIcon({
    super.key,
    required this.type,
    this.assetPath,
    this.icon,
    this.backgroundColor,
    this.color,
    this.size,
    this.boxSize,
    this.boxBorder,
    this.boxBorderRadius,
    this.boxPadding,
    this.fit,
  });

  getIconWidget() {
    switch (type) {
      case LMIconType.icon:
        return Icon(icon, color: color, size: size?.abs() ?? 24);
      case LMIconType.svg:
        return SizedBox(
          width: size?.abs() ?? 24,
          height: size?.abs() ?? 24,
          child: SvgPicture.asset(
            assetPath!,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcATop),
            fit: fit ?? BoxFit.contain,
          ),
        );
      case LMIconType.png:
        return SizedBox(
          width: size?.abs() ?? 24,
          height: size?.abs() ?? 24,
          child: Image.asset(
            assetPath!,
            fit: BoxFit.contain,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize?.abs(),
      width: boxSize?.abs(),
      padding: EdgeInsets.all(boxPadding?.abs() ?? 0),
      child: Center(child: getIconWidget()),
    );
  }
}
