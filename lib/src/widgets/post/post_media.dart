import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/utils/helpers.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/common/text/text_view.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/carousel.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/document.dart';
import 'package:likeminds_feed_ui_fl/src/widgets/media/link.dart';

class LMPostMedia extends StatefulWidget {
  const LMPostMedia({super.key, required this.attachments});

  final List<Attachment> attachments;

  @override
  State<LMPostMedia> createState() => _LMPostMediaState();
}

class _LMPostMediaState extends State<LMPostMedia> {
  late List<Attachment> attachments;
  late Size screenSize;

  @override
  void initState() {
    super.initState();
    attachments = widget.attachments;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    // attachments = InheritedPostProvider.of(context)?.post.attachments ?? [];
    if (attachments.first.attachmentType == 3) {
      /// If the attachment is a document, we need to call the method 'getDocumentList'
      return getPostDocuments();
    } else if (attachments.first.attachmentType == 4) {
      return LMLinkPreview(attachment: attachments[0]);
    } else {
      return LMCarousel(
        attachments: attachments,
      );
    }
  }

  Widget getPostDocuments() {
    List<Widget> documents;
    bool isCollapsed = true;

    documents = attachments
        .map(
          (e) => LMDocument(
            // document: e,
            size: PostHelper.getFileSizeString(bytes: e.attachmentMeta.size!),
            documentUrl: e.attachmentMeta.url,
            type: e.attachmentMeta.format!,
          ),
        )
        .toList();

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: screenSize.width - 32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: documents != null && documents.length > 3 && isCollapsed
                  ? documents.sublist(0, 3)
                  : documents,
            ),
            documents != null && documents.length > 3 && isCollapsed
                ? GestureDetector(
                    onTap: () => setState(() {
                          isCollapsed = false;
                        }),
                    child: LMTextView(
                      text: '+ ${documents.length - 3} more',
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
