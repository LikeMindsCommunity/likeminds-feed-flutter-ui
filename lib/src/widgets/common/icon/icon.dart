import 'package:flutter/material.dart';

class LMIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  final double? boxSize;
  final double? boxBorder;
  final double? boxBorderRadius;
  final double? boxPadding;
  final Color? backgroundColor;

  const LMIcon({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.color,
    this.size,
    this.boxSize,
    this.boxBorder,
    this.boxBorderRadius,
    this.boxPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxSize?.abs() ?? 32,
      width: boxSize?.abs() ?? 32,
      padding: EdgeInsets.all(boxPadding?.abs() ?? 6),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: size?.abs() ?? 24,
        ),
      ),
    );
  }
}
