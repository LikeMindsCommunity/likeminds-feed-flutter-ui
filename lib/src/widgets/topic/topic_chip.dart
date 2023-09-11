import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/utils/utils.dart';

/*
* Topic chip widget
* This widget is used to display a topic chip
* A topic chip is a chip that displays a topic name and an icon
* The icon can be placed before or after the topic name
* The icon can be tapped to perform an action
* The topic chip can be customized by passing in the required parameters
* and can be used in a list of chips
*/
class LMTopicChip extends StatelessWidget {
  // Action to perform after tapping on the topic chip
  final Function(TopicUI)? onIconTap;
  // Required parameters
  final TopicUI topic;
  // background color of the topic chip defaults to transparent
  final Color? backgroundColor;
  // border color of the topic chip defaults to null
  final Color? borderColor;
  // border radius of the topic chip defaults to 5.0
  final double? borderRadius;
  // showBorder must be true, border width of the topic chip defaults to 1.0
  final double? borderWidth;
  // Whether to show a border around the topic chip
  // defaults to false
  final bool showBorder;
  // Text style of the topic chip
  final TextStyle? textStyle;
  // Icon to be displayed in the topic chip
  final Widget? icon;
  // Padding of the topic chip
  final EdgeInsets? padding;
  // Whether to place the icon before the text or after the text of the topic chip
  // LMIconPlacement.start places the icon before the text
  // LMIconPlacement.end places the icon after the text
  final LMIconPlacement iconPlacement;
  final double? height;
  final EdgeInsets? margin;
  final bool gripChip;

  const LMTopicChip({
    Key? key,
    required this.topic,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.showBorder = false,
    this.textStyle,
    this.icon,
    this.padding,
    this.onIconTap,
    this.borderRadius,
    this.height,
    this.iconPlacement = LMIconPlacement.end,
    this.margin,
    this.gripChip = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topicText = Text(
      topic.name,
      style: textStyle,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return Container(
      margin: margin ?? const EdgeInsets.only(right: 8.0),
      alignment: Alignment.center,
      height: height,
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
          topic.name.isEmpty
              ? const SizedBox()
              : gripChip
                  ? Expanded(child: topicText)
                  : topicText,
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
