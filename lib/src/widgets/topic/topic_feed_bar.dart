import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/models/topic_view_model.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class TopicFeedBar extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showBorder;
  final Color textColor;
  final TextStyle? textStyle;
  final Icon? icon;
  final Function onClear;
  final Function(TopicViewModel) onIconTap;
  final Function onTap;

  List<TopicViewModel> selectedTopics;

  TopicFeedBar({
    Key? key,
    required this.selectedTopics,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.showBorder = false,
    required this.textColor,
    this.textStyle,
    this.icon,
    required this.onClear,
    required this.onIconTap,
    required this.onTap,
  }) : super(key: key);

  Widget selectedTopicsWidget(double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: selectedTopics.length,
                itemBuilder: (context, index) => LMTopicChip(
                  topic: selectedTopics[index],
                  textColor: textColor,
                  onIconTap: onIconTap,
                  showBorder: showBorder,
                  borderColor: borderColor,
                  borderWidth: borderWidth,
                  backgroundColor: backgroundColor,
                  textStyle: textStyle,
                  icon: icon,
                ),
              ),
            ),
          ),
          kHorizontalPaddingMedium,
          GestureDetector(
            onTap: () => onClear(),
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
    return const Padding(
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
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: kGrey2Color.withOpacity(0.1),
            ),
          ),
        ),
        child: selectedTopics.isEmpty
            ? emptyTopicsWidget()
            : selectedTopicsWidget(screenSize.width),
      ),
    );
  }
}
