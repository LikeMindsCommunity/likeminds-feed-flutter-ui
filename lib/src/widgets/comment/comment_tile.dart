import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/packages/expandable_text/expandable_text.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/utils/utils.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/buttons/text_button.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/profile_picture.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_menu.dart';

class LMCommentTile extends StatefulWidget {
  const LMCommentTile({
    super.key,
    required this.user,
    required this.comment,
    this.profilePicture,
    this.titleText,
    this.subtitleText,
    this.commentActions,
    this.actionsPadding,
    required this.onMenuTap,
    required this.onTagTap,
    this.backgroundColor,
    this.contentBackgroundColor,
    this.margin,
    this.borderRadius,
    this.width,
    this.menu,
    this.textStyle,
    this.linkStyle,
  });

  final User user;
  final Reply comment;

  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final LMProfilePicture? profilePicture;
  final LMTextView? titleText;
  final LMTextView? subtitleText;
  final List<Widget>? commentActions;
  final EdgeInsets? actionsPadding;
  final Function(int) onMenuTap;
  final Function(String) onTagTap;
  final Color? backgroundColor;
  final Color? contentBackgroundColor;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final Widget? menu;

  @override
  State<LMCommentTile> createState() => _LMCommentTileState();
}

class _LMCommentTileState extends State<LMCommentTile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? kWhiteColor,
        borderRadius: widget.borderRadius,
      ),
      margin: widget.margin,
      width: widget.width,
      padding: const EdgeInsets.all(kPaddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.profilePicture ?? const SizedBox(),
                kHorizontalPaddingLarge,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widget.width != null ? widget.width! * 0.6 : null,
                      child: widget.titleText ??
                          LMTextView(
                            text: widget.user.name,
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                          ),
                    ),
                    widget.subtitleText != null
                        ? kVerticalPaddingSmall
                        : const SizedBox(),
                    widget.subtitleText ?? const SizedBox(),
                  ],
                ),
                const Spacer(),
                widget.menu ??
                    LMPostMenu(
                      isFeed: false,
                      menuItems: widget.comment.menuItems,
                      onSelected: widget.onMenuTap,
                    ),
              ],
            ),
          ),
          kVerticalPaddingMedium,
          Container(
            padding: widget.actionsPadding ?? EdgeInsets.zero,
            child: ExpandableText(
              widget.comment.text,
              onTagTap: widget.onTagTap,
              expandText: "see more",
              animation: true,
              maxLines: 4,
              hashtagStyle: widget.linkStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: theme.colorScheme.primary),
              linkStyle: widget.linkStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: theme.colorScheme.primary),
              textAlign: TextAlign.left,
              style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          kVerticalPaddingSmall,
          Padding(
            padding: widget.actionsPadding ?? EdgeInsets.zero,
            child: Row(
              children: widget.commentActions ??
                  [
                    LMTextButton(
                      onTap: () {},
                      text: const LMTextView(
                        text: 'Like',
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: kGrey2Color,
                        ),
                      ),
                      icon: const LMIcon(
                        type: LMIconType.icon,
                        icon: Icons.favorite_outline,
                        color: kGrey2Color,
                        size: 16,
                      ),
                      activeIcon: const LMIcon(
                        icon: Icons.favorite,
                        type: LMIconType.icon,
                        size: 16,
                        color: kPrimaryColor,
                      ),
                    ),
                    kHorizontalPaddingMedium,
                    const Text(
                      '|',
                      style: TextStyle(
                        fontSize: kFontSmallMed,
                        color: kGrey3Color,
                      ),
                    ),
                    kHorizontalPaddingMedium,
                    LMTextButton(
                      onTap: () {},
                      text: const LMTextView(
                        text: 'Reply',
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: kGrey2Color,
                        ),
                      ),
                    ),
                    kHorizontalPaddingMedium,
                    widget.comment.repliesCount > 0
                        ? GestureDetector(
                            onTap: () {},
                            child: LMTextView(
                              text: widget.comment.repliesCount > 1
                                  ? "${widget.comment.repliesCount}  replies"
                                  : "${widget.comment.repliesCount}  reply",
                              textStyle: const TextStyle(
                                color: kGrey2Color,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : Container(),
                    const Spacer(),
                    LMTextView(
                      text: widget.comment.createdAt.timeAgo(),
                      textStyle: const TextStyle(
                        fontSize: kFontSmallMed,
                        color: kGrey3Color,
                      ),
                    ),
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
