import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';

class LMTextButton extends StatefulWidget {
  const LMTextButton({
    super.key,
    this.icon,
    required this.text,
    required this.onTap,
    this.activeIcon,
    this.activeText,
    this.backgroundColor,
    this.borderRadius = 4,
    this.height,
    this.width,
    this.margin,
    this.isActive = false,
  });

  final bool isActive;
  final double? margin;
  final LMIcon? icon;
  final LMTextView text;
  final Function() onTap;
  final LMIcon? activeIcon;
  final LMTextView? activeText;

  final Color? backgroundColor;
  final double borderRadius;
  final double? height;
  final double? width;

  @override
  State<LMTextButton> createState() => _LMTextButtonState();
}

class _LMTextButtonState extends State<LMTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: widget.height ?? 32,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.isActive
                  ? widget.activeIcon ?? const SizedBox()
                  : widget.icon ?? const SizedBox(),
              widget.icon != null || widget.activeIcon != null
                  ? SizedBox(width: widget.margin ?? 8)
                  : const SizedBox(),
              widget.isActive ? widget.activeText ?? widget.text : widget.text,
              SizedBox(width: widget.icon != null ? 6 : 0)
            ],
          ),
        ),
      ),
    );
  }
}
