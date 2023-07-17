import 'package:flutter/material.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post.dart';

class LMPostContent extends StatelessWidget {
  const LMPostContent({super.key});

  @override
  Widget build(BuildContext context) {
    final postDetails = InheritedPostProvider.of(context)?.post;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: SelectableText(
        postDetails!.text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
