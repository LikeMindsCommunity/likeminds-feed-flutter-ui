import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            theme: SvgTheme(currentColor: color!),
            fit: BoxFit.contain,
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
      height: boxSize?.abs() ?? 32,
      width: boxSize?.abs() ?? 32,
      padding: EdgeInsets.all(boxPadding?.abs() ?? 6),
      child: Center(child: getIconWidget()),
    );
  }
}
