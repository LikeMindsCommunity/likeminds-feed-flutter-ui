import 'package:flutter/material.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:likeminds_feed_ui_fl/src/utils/theme.dart';

class LMLinkPreview extends StatelessWidget {
  const LMLinkPreview({
    super.key,
    this.attachment,
    this.linkModel,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.onTap,
    this.title,
    this.subtitle,
    this.url,
    this.imageUrl,
  });

  final MediaModel? linkModel;
  final Attachment? attachment;

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? padding;
  final VoidCallback? onTap;

  final String? imageUrl;
  final LMTextView? title;
  final LMTextView? subtitle;
  final LMTextView? url;

  bool checkNullMedia() {
    return ((linkModel == null ||
            linkModel!.ogTags == null ||
            linkModel!.ogTags!.image == null ||
            linkModel!.ogTags!.image!.isEmpty) &&
        (attachment == null ||
            attachment!.attachmentMeta.ogTags == null ||
            attachment!.attachmentMeta.ogTags!.image == null));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border.all(
            color: kGrey3Color,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: width ?? MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            checkNullMedia()
                ? const SizedBox.shrink()
                : LMImage(
                    width: width,
                    height: 150,
                    borderRadius: borderRadius,
                    imageUrl: imageUrl ??
                        (linkModel != null
                            ? linkModel!.ogTags!.image!
                            : attachment!.attachmentMeta.ogTags!.image!),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width ?? MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width,
                      child: title ??
                          LMTextView(
                            text: linkModel != null
                                ? linkModel!.ogTags!.title!
                                : attachment!.attachmentMeta.ogTags!.title ??
                                    'NOT PRODUCING',
                            textStyle: const TextStyle(
                              color: kGrey1Color,
                              fontSize: kFontMedium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    ),
                    kVerticalPaddingSmall,
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width,
                      child: subtitle ??
                          LMTextView(
                            text: linkModel != null
                                ? linkModel!.ogTags!.description!
                                : attachment!
                                        .attachmentMeta.ogTags!.description ??
                                    'NOT PRODUCING',
                            maxLines: 2,
                            textStyle: const TextStyle(
                              color: kGrey3Color,
                              fontSize: kFontSmall,
                            ),
                          ),
                    ),
                    kVerticalPaddingXSmall,
                    SizedBox(
                      width: width ?? MediaQuery.of(context).size.width,
                      child: LMTextView(
                        text: linkModel != null
                            ? linkModel!.link ?? linkModel!.ogTags!.url!
                            : attachment!.attachmentMeta.ogTags!.url != null
                                ? attachment!.attachmentMeta.ogTags!.url!
                                    .toLowerCase()
                                : 'NOT PRODUCING',
                        maxLines: 1,
                        textStyle: const TextStyle(
                          color: kGrey3Color,
                          fontSize: kFontXSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
