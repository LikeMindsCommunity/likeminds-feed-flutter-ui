import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class TopicTile extends StatelessWidget {
  final Function(TopicViewModel) onTap;
  final MainAxisAlignment? tileRowAlignment;
  final Color? backgroundColor;
  final double? height;
  final Icon icon;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? padding;
  final bool isSelected;
  final LMTextView text;
  final TopicViewModel topic;

  const TopicTile({
    Key? key,
    required this.topic,
    required this.icon,
    this.tileRowAlignment,
    this.height,
    required this.isSelected,
    required this.onTap,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
    this.borderWidth,
    this.padding,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(topic),
      child: Container(
        height: height,
        padding: padding,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: tileRowAlignment ?? MainAxisAlignment.spaceBetween,
          children: [
            text,
            kHorizontalPaddingLarge,
            isSelected ? icon : const SizedBox()
          ],
        ),
      ),
    );
  }
}
