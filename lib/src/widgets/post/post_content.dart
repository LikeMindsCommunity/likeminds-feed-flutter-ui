import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/packages/expandable_text/expandable_text.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post.dart';

class LMPostContent extends StatelessWidget {
  const LMPostContent({
    super.key,
    this.text,
    this.visibleLines,
    this.textStyle,
    this.linkStyle,
    this.animation,
  });

  final String? text;

  final int? visibleLines;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final bool? animation;

  @override
  Widget build(BuildContext context) {
    final postDetails = InheritedPostProvider.of(context)?.post;
    return ExpandableText(
      text ?? postDetails!.text,
      expandText: "see more",
      animation: animation ?? true,
      maxLines: visibleLines ?? 4,
      linkStyle: linkStyle ??
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: kLinkColor),
      textAlign: TextAlign.left,
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
