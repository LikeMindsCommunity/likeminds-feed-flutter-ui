import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class TopicFeedGrid extends StatelessWidget {
  // Required parameters
  // Text color of the topic chip
  final Color textColor;
  // List of selected topic [pass empty list if no topic is selected]
  final List<TopicViewModel> selectedTopics;
  // Action to perform after tapping on the topic feed bar
  final Function onTap;

  final bool showBorder;
  // background color of the topic chip defaults to transparent
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final TextStyle? textStyle;
  // Icon to be displayed on the topic chip if any defaults to null
  final Icon? icon;
  final Function(TopicViewModel)? onIconTap;
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

  const TopicFeedGrid({
    Key? key,
    required this.selectedTopics,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
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
        gridWidget.add(
          Container(
            color: Colors.transparent,
            height: height,
            child: LMTopicChip(
              padding: chipPadding,
              topic: TopicViewModel(
                id: "-1",
                name: "",
                isEnabled: false,
              ),
              textColor: textColor,
              height: height,
              onIconTap: (tapped) {
                onTap();
              },
              showBorder: showBorder,
              borderColor: borderColor,
              borderWidth: borderWidth,
              backgroundColor: backgroundColor,
              textStyle: textStyle,
              icon: trailingIcon,
              iconPlacement: iconPlacement,
              margin: EdgeInsets.zero,
            ),
          ),
        );
        continue;
      }
      gridWidget.add(
        Container(
          color: Colors.transparent,
          height: height,
          child: LMTopicChip(
            padding: chipPadding,
            topic: selectedTopics[i],
            textColor: textColor,
            onIconTap: onIconTap,
            showBorder: showBorder,
            height: height,
            borderColor: borderColor,
            borderWidth: borderWidth,
            backgroundColor: backgroundColor,
            textStyle: textStyle,
            icon: icon,
            margin: EdgeInsets.zero,
          ),
        ),
      );
    }
    // calculates the number of rows to calculate total height of the topic grid
    int count = (itemCount / 4).ceil();
    // calculates the height of topic grid using the number of rows
    double gridHeight = (height + 8) * count;
    return SizedBox(
      width: width,
      height: gridHeight,
      child: LayoutGrid(
        gridFit: GridFit.passthrough,
        columnSizes: itemCount == 1
            ? [auto, 1.fr, 1.fr, 1.fr]
            : itemCount == 2
                ? [auto, auto, 1.fr, 1.fr]
                : itemCount == 3
                    ? [auto, auto, auto, 1.fr]
                    : [auto, auto, auto, auto],
        rowSizes: itemCount == 1
            ? [auto]
            : itemCount == 2
                ? [auto, auto]
                : itemCount == 3
                    ? [auto, auto, auto]
                    : [auto, auto, auto, auto],
        rowGap: 8.0,
        columnGap: 8.0,
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
