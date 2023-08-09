import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';

enum LMIconButtonPlacement { start, end }

class LMIconButton extends StatefulWidget {
  const LMIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.activeIcon,
    this.containerSize,
    this.borderRadius,
    this.backgroundColor,
  });

  final LMIcon icon;
  final Function(bool activeStatus) onTap;
  final LMIcon? activeIcon;

  final double? containerSize;
  final double? borderRadius;
  final Color? backgroundColor;

  @override
  State<LMIconButton> createState() => _LMIconButtonState();
}

class _LMIconButtonState extends State<LMIconButton> {
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isActive = !_isActive;
        });
        widget.onTap(_isActive);
      },
      child: Container(
        height: widget.containerSize ?? 32,
        width: widget.containerSize ?? 32,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
        ),
        child: _isActive ? widget.activeIcon ?? widget.icon : widget.icon,
      ),
    );
  }
}
