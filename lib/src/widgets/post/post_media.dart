import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:url_launcher/url_launcher.dart';

class LMPostMedia extends StatefulWidget {
  const LMPostMedia({
    super.key,
    required this.attachments,
    this.documentIcon,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.showLinkUrl = false,
  });

  final List<Attachment> attachments;
  final LMIcon? documentIcon;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool showLinkUrl;

  @override
  State<LMPostMedia> createState() => _LMPostMediaState();
}

class _LMPostMediaState extends State<LMPostMedia> {
  late List<Attachment> attachments;
  late Size screenSize;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    attachments = widget.attachments;
    screenSize = MediaQuery.of(context).size;
    // attachments = InheritedPostProvider.of(context)?.post.attachments ?? [];
    if (attachments.first.attachmentType == 3) {
      /// If the attachment is a document, we need to call the method 'getDocumentList'
      return getPostDocuments();
    } else if (attachments.first.attachmentType == 4) {
      return LMLinkPreview(
        attachment: attachments[0],
        borderRadius: widget.borderRadius,
        backgroundColor: widget.backgroundColor,
        showLinkUrl: widget.showLinkUrl,
      );
    } else {
      return LMCarousel(
        attachments: attachments,
        borderRadius: widget.borderRadius,
        // width: widget.width,
        // height: widget.height,
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
            documentIcon: widget.documentIcon,
            type: e.attachmentMeta.format!,
            onTap: () {
              Uri fileUrl = Uri.parse(e.attachmentMeta.url!);
              launchUrl(fileUrl, mode: LaunchMode.externalApplication);
            },
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
