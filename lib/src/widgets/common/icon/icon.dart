import 'package:flutter/material.dart';

class LMIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;

  const LMIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
