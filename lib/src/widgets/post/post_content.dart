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
    required this.onTagTap,
  });

  final String? text;

  final int? visibleLines;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final bool? animation;
  final Function(String) onTagTap;

  @override
  Widget build(BuildContext context) {
    final postDetails = InheritedPostProvider.of(context)?.post;
    final ThemeData theme = Theme.of(context);
    return ExpandableText(
      text ?? postDetails!.text,
      onTagTap: onTagTap,
      expandText: "see more",
      animation: animation ?? true,
      maxLines: visibleLines ?? 4,
      hashtagStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: theme.colorScheme.primary),
      linkStyle: linkStyle ??
          Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: theme.colorScheme.primary),
      textAlign: TextAlign.left,
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
