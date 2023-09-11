import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/utils/utils.dart';

// This widget is used to display a topic grid
// A [LMTopicFeedGrid] displays a grid of selected topics
// The [LMTopicFeedGrid] can be customized by passing in the required parameters
class LMTopicFeedGrid extends StatelessWidget {
  // Required parameters
  // Text color of the topic chip
  final Color textColor;
  // List of selected topic [pass empty list if no topic is selected]
  final List<TopicUI> selectedTopics;
  // Action to perform after tapping on the topic feed bar
  final Function onTap;

  final bool showBorder;
  // background color of the topic chip defaults to transparent
  final Color? backgroundColor;
  // border color of the topic chip defaults to 5.0
  final double? borderRadius;
  // border color of the topic chip defaults to transparent
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  // Icon to be displayed on the topic chip if any defaults to null
  final Icon? icon;
  final Function(TopicUI)? onIconTap;
  final Widget? trailingIcon;
  final Function? onTrailingIconTap;
  final EdgeInsets? chipPadding;
  // Whether to show divider below topic feed bar or not
  // defaults to true
  final bool showDivider;
  // Height of the chips of topic feed bar
  final double height;
  // Placeholder chip if no topic is selected
  final Widget? emptyTopicChip;
  // Whether to place the icon before the text or after the text of the topic chip
  // LMIconPlacement.start places the icon before the text
  // LMIconPlacement.end places the icon after the text
  final LMIconPlacement iconPlacement;

  const LMTopicFeedGrid({
    Key? key,
    required this.selectedTopics,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.showBorder = false,
    required this.textColor,
    this.textStyle,
    this.icon,
    this.onIconTap,
    required this.onTap,
    this.trailingIcon,
    this.onTrailingIconTap,
    this.chipPadding,
    required this.height,
    this.showDivider = true,
    this.emptyTopicChip,
    this.iconPlacement = LMIconPlacement.end,
  }) : super(key: key);

  Widget selectedTopicsWidget(double width) {
    int length = selectedTopics.length;

    List<Widget> gridWidget = [];
    int itemCount = trailingIcon == null ? length : length + 1;

    for (int i = 0; i < itemCount; i++) {
      if (i == itemCount - 1 && trailingIcon != null) {
        gridWidget.add(trailingIcon!);
        continue;
      }

      gridWidget.add(
        Chip(
          label: Text(selectedTopics[i].name),
          onDeleted: onIconTap == null
              ? null
              : () {
                  if (onIconTap != null) {
                    onIconTap!(selectedTopics[i]);
                  }
                },
          deleteIcon: icon,
          backgroundColor: backgroundColor,
          labelStyle: textStyle,
          clipBehavior: Clip.hardEdge,
          padding: chipPadding,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 0.0,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 5.0)),
        ),
      );
    }
    return SizedBox(
      width: width,
      child: Wrap(
        spacing: 5.0, // gap between adjacent chips
        runSpacing: 5.0,
        children: gridWidget,
      ),
    );
  }

  Widget emptyTopicsWidget() {
    return emptyTopicChip != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              emptyTopicChip!,
            ],
          )
        : const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Text(
                  'All topics',
                ),
                kHorizontalPaddingMedium,
                Icon(
                  Icons.arrow_downward,
                  size: 18,
                )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: showDivider ? const EdgeInsets.only(bottom: 12.0) : null,
        decoration: BoxDecoration(
          border: showDivider
              ? Border(
                  bottom: BorderSide(
                    width: 1,
                    color: kGrey2Color.withOpacity(0.1),
                  ),
                )
              : null,
        ),
        child: selectedTopics.isEmpty
            ? emptyTopicsWidget()
            : selectedTopicsWidget(screenSize.width),
      ),
    );
  }
}
