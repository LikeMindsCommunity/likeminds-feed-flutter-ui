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
    this.isActive = false,
  });

  final bool isActive;
  final LMIcon? icon;
  final LMTextView text;
  final Function(bool activeStatus) onTap;
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
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
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
              widget.icon != null
                  ? _isActive
                      ? widget.activeIcon ?? widget.icon!
                      : widget.icon!
                  : const SizedBox(),
              widget.icon != null ? const SizedBox(width: 8) : const SizedBox(),
              _isActive ? widget.activeText ?? widget.text : widget.text,
              SizedBox(width: widget.icon != null ? 6 : 0)
            ],
          ),
        ),
      ),
    );
  }
}
