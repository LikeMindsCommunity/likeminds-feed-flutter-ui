import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/packages/expandable_text/expandable_text.dart';
import 'package:likeminds_feed_ui_fl/src/utils/helpers.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/buttons/text_button.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/profile_picture.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_menu.dart';

class LMReplyTile extends StatefulWidget {
  const LMReplyTile({
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
  });

  final User user;
  final CommentReply comment;

  final LMProfilePicture? profilePicture;
  final LMTextView? titleText;
  final LMTextView? subtitleText;
  final List<Widget>? commentActions;
  final EdgeInsets? actionsPadding;
  final Function(int) onMenuTap;
  final Function(String) onTagTap;

  @override
  State<LMReplyTile> createState() => _LMReplyTileState();
}

class _LMReplyTileState extends State<LMReplyTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      padding: const EdgeInsets.symmetric(
          horizontal: kPaddingLarge, vertical: kPaddingSmall),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    widget.titleText ??
                        LMTextView(
                          text: widget.user.name,
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    widget.subtitleText != null
                        ? kVerticalPaddingSmall
                        : const SizedBox(),
                    widget.subtitleText ?? const SizedBox(),
                    Container(
                      width: 240,
                      padding: const EdgeInsets.only(top: 12, bottom: 6),
                      child: ExpandableText(
                        widget.comment.text,
                        onTagTap: widget.onTagTap,
                        expandText: "see more",
                        animation: true,
                        maxLines: 4,
                        linkStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kLinkColor),
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                LMPostMenu(
                  isFeed: false,
                  menuItems: widget.comment.menuItems,
                  onSelected: widget.onMenuTap,
                ),
              ],
            ),
          ),
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
                    const Spacer(),
                  ],
            ),
          ),
        ],
      ),
      // kVerticalPaddingMedium,
    );
  }
}
