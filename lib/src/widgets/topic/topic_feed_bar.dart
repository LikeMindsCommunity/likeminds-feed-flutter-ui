import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

// This widget is used to display a topic feed bar
// A [LMTopicFeedBar] displays a list of selected topics
// The [LMTopicFeedBar] can be customized by passing in the required parameters
class LMTopicFeedBar extends StatelessWidget {
  // Required parameters
  // List of selected topic [pass empty list if no topic is selected]
  final List<TopicUI> selectedTopics;
  // Action to perform after tapping on the topic feed bar
  final Function onTap;

  final bool showBorder;
  // background color of the topic chip defaults to transparent
  final Color? backgroundColor;
  // border color of the topic chip defaults to null
  final Color? borderColor;
  // border width of the topic chip defaults to 1.0
  final double? borderWidth;
  final TextStyle? textStyle;
  // Icon to be displayed on the topic chip if any defaults to null
  final Icon? icon;
  final Function? onClear;
  final Function(TopicUI)? onIconTap;
  final Widget? trailingIcon;
  final Function? onTrailingIconTap;
  final EdgeInsets? chipPadding;
  // Whether to show divider below topic feed bar or not
  // defaults to true
  final bool showDivider;
  // Height of the chips of topic feed bar, defaults to 30.0
  final double? height;
  // Placeholder chip if no topic is selected
  final Widget? emptyTopicChip;
  // Whether to place the icon before the text
  // or after the text of the topic chip
  // LMIconPlacement.start places the icon before the text
  // LMIconPlacement.end places the icon after the text
  final LMIconPlacement iconPlacement;

  const LMTopicFeedBar({
    Key? key,
    required this.selectedTopics,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.showBorder = false,
    this.textStyle,
    this.icon,
    this.onClear,
    this.onIconTap,
    required this.onTap,
    this.trailingIcon,
    this.onTrailingIconTap,
    this.chipPadding,
    this.height,
    this.showDivider = true,
    this.emptyTopicChip,
    this.iconPlacement = LMIconPlacement.end,
  }) : super(key: key);

  // Topic feed bar with selected topics
  // If a trailing icon is passed, it is displayed
  // at the end of the list of selected topics
  // If no trailing icon is passed, the topic
  // feed bar displays only the list of selected topics
  Widget selectedTopicsWidget(double width) {
    return SizedBox(
      width: width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: height ?? 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: trailingIcon == null
                      ? selectedTopics.length
                      : selectedTopics.length + 1,
                  itemBuilder: (context, index) {
                    if (index == selectedTopics.length &&
                        trailingIcon != null) {
                      return Container(
                        color: Colors.transparent,
                        child: LMTopicChip(
                          padding: chipPadding,
                          topic: (TopicUIBuilder()
                                ..id("-1")
                                ..isEnabled(false)
                                ..name("name"))
                              .build(),
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
                        ),
                      );
                    }
                    return Container(
                      color: Colors.transparent,
                      child: LMTopicChip(
                        padding: chipPadding,
                        topic: selectedTopics[index],
                        onIconTap: onIconTap,
                        showBorder: showBorder,
                        borderColor: borderColor,
                        borderWidth: borderWidth,
                        backgroundColor: backgroundColor,
                        textStyle: textStyle,
                        icon: icon,
                      ),
                    );
                  }),
            ),
          ),
          kHorizontalPaddingMedium,
          onClear == null
              ? const SizedBox()
              : GestureDetector(
                  onTap: () => onClear!(),
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Clear",
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  // Topic feed bar with no topic selected [Placeholder chip]
  // If no placeholder chip is passed, a default placeholder chip is displayed`
  // The default placeholder chip displays "All topics" text
  Widget emptyTopicsWidget() {
    return emptyTopicChip != null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              emptyTopicChip!,
            ],
          )
        : Container(
            height: height,
            padding: const EdgeInsets.all(10.0),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 0.1,
                    color: kGrey2Color.withOpacity(0.05),
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
