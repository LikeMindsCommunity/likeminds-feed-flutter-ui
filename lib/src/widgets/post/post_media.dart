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
    this.carouselActiveIndicatorColor,
    this.carouselInactiveIndicatorColor,
    this.title,
    this.subtitle,
    this.showBorder = true,
    this.errorWidget,
    this.boxFit,
    this.textColor,
  });

  final List<Attachment> attachments;
  final Widget? documentIcon;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool showLinkUrl;
  final LMTextView? title;
  final LMTextView? subtitle;
  final bool showBorder;
  final Widget? errorWidget;
  final BoxFit? boxFit;
  final Color? textColor;

  final Color? carouselActiveIndicatorColor;
  final Color? carouselInactiveIndicatorColor;

  @override
  State<LMPostMedia> createState() => _LMPostMediaState();
}

class _LMPostMediaState extends State<LMPostMedia> {
  List<Attachment>? attachments;
  late Size screenSize;

  void initialiseAttachments() {
    attachments = [...widget.attachments];
    attachments?.removeWhere((element) => element.attachmentType == 5);
  }

  @override
  void initState() {
    super.initState();
    initialiseAttachments();
  }

  @override
  void didUpdateWidget(LMPostMedia oldWidget) {
    super.didUpdateWidget(oldWidget);
    initialiseAttachments();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    if (attachments == null || attachments!.isEmpty) {
      return const SizedBox();
    }
    // attachments = InheritedPostProvider.of(context)?.post.attachments ?? [];
    if (attachments!.first.attachmentType == 3) {
      /// If the attachment is a document, we need to call the method 'getDocumentList'
      return getPostDocuments();
    } else if (attachments!.first.attachmentType == 4) {
      return LMLinkPreview(
        attachment: attachments![0],
        borderRadius: widget.borderRadius,
        backgroundColor: widget.backgroundColor,
        showLinkUrl: widget.showLinkUrl,
        title: widget.title,
        subtitle: widget.subtitle,
        errorWidget: widget.errorWidget,
      );
    } else {
      return LMCarousel(
        attachments: attachments!,
        borderRadius: widget.borderRadius,
        activeIndicatorColor: widget.carouselActiveIndicatorColor,
        inactiveIndicatorColor: widget.carouselInactiveIndicatorColor,
        errorWidget: widget.errorWidget,
        boxFit: widget.boxFit,
        width: widget.width,
        height: widget.height,
      );
    }
  }

  Widget getPostDocuments() {
    List<Widget> documents;
    bool isCollapsed = true;

    documents = attachments!
        .map(
          (e) => LMDocument(
            // document: e,
            size: PostHelper.getFileSizeString(bytes: e.attachmentMeta.size!),
            documentUrl: e.attachmentMeta.url,
            documentIcon: widget.documentIcon,
            showBorder: widget.showBorder,
            type: e.attachmentMeta.format!,
            backgroundColor: widget.backgroundColor,
            textColor: widget.textColor,
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
              children: documents.length > 3 && isCollapsed
                  ? documents.sublist(0, 3)
                  : documents,
            ),
            documents.length > 3 && isCollapsed
                ? GestureDetector(
                    onTap: () => setState(() {
                          isCollapsed = false;
                        }),
                    child: LMTextView(
                      text: '+ ${documents.length - 3} more',
                      textStyle: TextStyle(
                        color: widget.textColor ??
                            Theme.of(context).colorScheme.secondary,
                      ),
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
