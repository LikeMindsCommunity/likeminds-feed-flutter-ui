import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/utils.dart';

// This widget is used to display a text button
// The [LMTextButton] can be customized by passing in the required parameters
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
    this.padding,
    this.placement = LMIconPlacement.start,
  });

  // Required parameters, defines whether the button is active or disabled
  final bool isActive;
  final double? margin;
  // Icon to be displayed in the button
  final LMIcon? icon;
  // Text to be displayed in the button, [LMTextView] only
  final LMTextView text;
  // Action to perform after tapping on the button
  final Function() onTap;
  // Icon to be displayed in the button if the button is active
  final LMIcon? activeIcon;
  // Text to be displayed in the button if the button is active, [LMTextView] only
  final LMTextView? activeText;
  // Padding of the button, defaults to zero
  final EdgeInsets? padding;
  // Background color of the button, defaults to transparent
  final Color? backgroundColor;
  // Border radius of the button, required
  final double borderRadius;
  final double? height;
  final double? width;
  // Placement of the icon in the button, required
  final LMIconPlacement placement;

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
        padding: widget.padding ?? EdgeInsets.zero,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        alignment: Alignment.center,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.placement == LMIconPlacement.start
                  ? widget.isActive
                      ? widget.activeIcon ?? const SizedBox()
                      : widget.icon ?? const SizedBox()
                  : const SizedBox(),
              widget.placement == LMIconPlacement.start
                  ? (widget.icon != null || widget.activeIcon != null)
                      ? SizedBox(width: widget.margin ?? 8)
                      : const SizedBox()
                  : const SizedBox(),
              widget.isActive ? widget.activeText ?? widget.text : widget.text,
              widget.placement == LMIconPlacement.end
                  ? (widget.icon != null || widget.activeIcon != null)
                      ? SizedBox(width: widget.margin ?? 8)
                      : const SizedBox()
                  : const SizedBox(),
              widget.placement == LMIconPlacement.end
                  ? widget.isActive
                      ? widget.activeIcon ?? const SizedBox()
                      : widget.icon ?? const SizedBox()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
