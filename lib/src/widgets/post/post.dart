import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_content.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_footer.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_header.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_media.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/post/post_menu.dart';

/// A widget that displays a post on the feed.
/// Provide a header, footer, menu, media and content instance to customize the post.
///
class LMPostWidget extends StatefulWidget {
  final LMPostHeader? header;
  final LMPostFooter? footer;
  final LMPostMenu? menu;
  final LMPostMedia? media;

  // Required variables
  final PostViewData post;
  final User user;
  final bool isFeed;
  final Function() onTap;
  final Function(String) onTagTap;

  const LMPostWidget({
    super.key,
    required this.post,
    required this.user,
    required this.onTap,
    required this.isFeed,
    required this.onTagTap,
    this.header,
    this.footer,
    this.menu,
    this.media,
  });

  @override
  State<LMPostWidget> createState() => _LMPostWidgetState();
}

class _LMPostWidgetState extends State<LMPostWidget> {
  // Internal variables

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedPostProvider(
      post: widget.post,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: kWhiteColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.header ??
                    LMPostHeader(
                      user: widget.user,
                      isFeed: widget.isFeed,
                    ),
                LMPostContent(
                  onTagTap: widget.onTagTap,
                ),
                widget.media == null
                    ? widget.post.attachments != null &&
                            widget.post.attachments!.isNotEmpty
                        ? LMPostMedia(attachments: widget.post.attachments!)
                        : const SizedBox()
                    : widget.media!,
                const SizedBox(height: 18),
                widget.footer ?? const LMPostFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InheritedPostProvider extends InheritedWidget {
  const InheritedPostProvider({
    super.key,
    required this.child,
    required this.post,
  }) : super(child: child);

  @override
  final Widget child;
  final PostViewData post;

  static InheritedPostProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedPostProvider>();
  }

  @override
  bool updateShouldNotify(InheritedPostProvider oldWidget) {
    return true;
  }
}
