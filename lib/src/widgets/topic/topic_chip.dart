import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class LMTopicChip extends StatelessWidget {
  final Function(TopicViewModel)? onIconTap;
  final TopicViewModel topic;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showBorder;
  final Color textColor;
  final TextStyle? textStyle;
  final Icon? icon;

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
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
          Text(
            topic.name,
            style: textStyle ?? TextStyle(color: textColor),
          ),
          kHorizontalPaddingSmall,
          icon != null
              ? GestureDetector(
                  onTap: onIconTap != null ? () => onIconTap!(topic) : null,
                  child: icon)
              : const SizedBox()
        ],
      ),
    );
  }
}
