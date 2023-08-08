import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class TopicFeedBar extends StatelessWidget {
  // Required parameters
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
  final Function? onClear;
  final Function(TopicViewModel)? onIconTap;
  final Widget? trailingIcon;
  final Function? onTrailingIconTap;
  final EdgeInsets? chipPadding;
  // Whether to show divider below topic feed bar or not
  // defaults to true
  final bool showDivider;
  // Height of the chips of topic feed bar
  final double? height;
  // Placeholder chip if no topic is selected
  final Widget? emptyTopicChip;
  // Whether to place the icon before the text or after the text of the topic chip
  // LMIconPlacement.start places the icon before the text
  // LMIconPlacement.end places the icon after the text
  final LMIconPlacement iconPlacement;

  const TopicFeedBar({
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
                          topic: TopicViewModel(
                            id: "-1",
                            name: "",
                            isEnabled: false,
                          ),
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

  Widget emptyTopicsWidget() {
    return emptyTopicChip != null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              emptyTopicChip!,
            ],
          )
        : Container(
            height: height,
            padding: const EdgeInsets.all(10.0),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
