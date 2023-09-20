import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/utils/utils.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/icon/icon.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/profile_picture.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_menu.dart';

class LMPostHeader extends StatelessWidget {
  const LMPostHeader({
    super.key,
    required this.user,
    this.imageSize,
    this.titleText,
    this.subText,
    this.menu,
    this.createdAt,
    this.onProfileTap,
    required this.isFeed,
  });

  final double? imageSize;
  final LMTextView? titleText;
  final LMTextView? subText;
  final LMPostMenu? menu;
  final LMTextView? createdAt;
  final Function()? onProfileTap;
  final bool isFeed;

  final User user;

  @override
  Widget build(BuildContext context) {
    final postDetails = InheritedPostProvider.of(context)?.post;
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          width: screenSize.width - 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Provide john doe name and placeholder image link to LMProfilePicture
              LMProfilePicture(
                size: imageSize ?? 42,
                fallbackText: user.name,
                imageUrl: user.imageUrl,
                onTap: onProfileTap,
              ),
              kHorizontalPaddingLarge,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onProfileTap != null) {
                              onProfileTap!();
                            }
                          },
                          child: titleText ??
                              LMTextView(
                                text: user.name,
                                textStyle: const TextStyle(
                                  fontSize: kFontMedium,
                                  color: kGrey1Color,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        ),
                        kHorizontalPaddingMedium,
                        (user.customTitle == null ||
                                    user.customTitle!.isEmpty) ||
                                (user.isDeleted != null && user.isDeleted!)
                            ? const SizedBox()
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        user.customTitle!.isNotEmpty
                                            ? user.customTitle!
                                            : "",
                                        // maxLines: 1,
                                        style: TextStyle(
                                          fontSize: kFontSmall,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: user.name.isNotEmpty
                                              ? FontStyle.normal
                                              : FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    kVerticalPaddingSmall,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        subText ?? const SizedBox(),
                        subText != null
                            ? kHorizontalPaddingXSmall
                            : const SizedBox(),
                        LMTextView(
                          text: subText != null ? '·' : '',
                          textStyle: const TextStyle(
                            fontSize: kFontSmall,
                            color: kGrey3Color,
                          ),
                        ),
                        subText != null
                            ? kHorizontalPaddingXSmall
                            : const SizedBox(),
                        createdAt ??
                            LMTextView(
                              text: postDetails!.createdAt.timeAgo(),
                              textStyle: const TextStyle(
                                fontSize: kFontSmall,
                                color: kGrey3Color,
                              ),
                            ),
                        kHorizontalPaddingXSmall,
                        LMTextView(
                          text: postDetails!.isEdited ? '·' : '',
                          textStyle: const TextStyle(
                            fontSize: kFontSmall,
                            color: kGrey3Color,
                          ),
                        ),
                        kHorizontalPaddingXSmall,
                        LMTextView(
                          text: postDetails.isEdited ? 'Edited' : '',
                          textStyle: const TextStyle(
                            fontSize: kFontSmall,
                            color: kGrey3Color,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              kHorizontalPaddingLarge,
              postDetails.menuItems.isNotEmpty
                  ? menu ??
                      LMPostMenu(
                          menuItems: postDetails.menuItems,
                          isFeed: isFeed,
                          onSelected: (id) {})
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
