import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

enum LMIconPlacement { start, end }

class LMTopicChip extends StatelessWidget {
  // Action to perform after tapping on the topic chip
  final Function(TopicViewModel)? onIconTap;
  // Required parameters
  final TopicViewModel topic;
  // background color of the topic chip defaults to transparent
  final Color? backgroundColor;
  // border color of the topic chip defaults to null
  final Color? borderColor;
  final double? borderWidth;
  final bool showBorder;
  // Text color of the topic chip
  final Color textColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final EdgeInsets? padding;
  // Whether to place the icon before the text or after the text of the topic chip
  // LMIconPlacement.start places the icon before the text
  // LMIconPlacement.end places the icon after the text
  final LMIconPlacement iconPlacement;

  const LMTopicChip({
    Key? key,
    required this.topic,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.showBorder = false,
    required this.textColor,
    this.textStyle,
    this.icon,
    this.padding,
    this.onIconTap,
    this.iconPlacement = LMIconPlacement.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      alignment: Alignment.center,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: showBorder
            ? Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1,
              )
            : null,
        color: backgroundColor ?? Colors.transparent,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null && iconPlacement == LMIconPlacement.start
              ? GestureDetector(
                  onTap: onIconTap != null ? () => onIconTap!(topic) : null,
                  child: Container(
                    color: Colors.transparent,
                    child: icon,
                  ),
                )
              : const SizedBox(),
          icon != null && iconPlacement == LMIconPlacement.start
              ? kHorizontalPaddingSmall
              : const SizedBox(),
          Text(
            topic.name,
            style: textStyle ?? TextStyle(color: textColor),
          ),
          icon != null && iconPlacement == LMIconPlacement.end
              ? kHorizontalPaddingSmall
              : const SizedBox(),
          icon != null && iconPlacement == LMIconPlacement.end
              ? GestureDetector(
                  onTap: onIconTap != null ? () => onIconTap!(topic) : null,
                  child: Container(
                    color: Colors.transparent,
                    child: icon,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
