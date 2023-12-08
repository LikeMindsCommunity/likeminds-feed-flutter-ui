import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:lm_feed_ui_example/convertors/helper/og_tag_convertor.dart';

class AttachmentMetaViewDataConvertor {
  static AttachmentMetaViewData attachmentMeta(
      {required AttachmentMeta attachmentMeta}) {
    AttachmentMetaViewDataBuilder attachmentMetaViewDataBuilder =
        AttachmentMetaViewDataBuilder();
    if (attachmentMeta.url != null) {
      attachmentMetaViewDataBuilder.url(attachmentMeta.url!);
    }

    if (attachmentMeta.format != null) {
      attachmentMetaViewDataBuilder.format(attachmentMeta.format!);
    }
    if (attachmentMeta.size != null) {
      attachmentMetaViewDataBuilder.size(attachmentMeta.size!);
    }
    if (attachmentMeta.duration != null) {
      attachmentMetaViewDataBuilder.duration(attachmentMeta.duration!);
    }
    if (attachmentMeta.pageCount != null) {
      attachmentMetaViewDataBuilder.pageCount(attachmentMeta.pageCount!);
    }
    if (attachmentMeta.ogTags != null) {
      attachmentMetaViewDataBuilder
          .ogTags(OgTagsViewDataConvertor.fromOgTags(attachmentMeta.ogTags!));
    }
    if (attachmentMeta.aspectRatio != null) {
      attachmentMetaViewDataBuilder.aspectRatio(attachmentMeta.aspectRatio!);
    }
    if (attachmentMeta.width != null) {
      attachmentMetaViewDataBuilder.width(attachmentMeta.width!);
    }
    if (attachmentMeta.height != null) {
      attachmentMetaViewDataBuilder.height(attachmentMeta.height!);
    }
    if (attachmentMeta.meta != null) {
      attachmentMetaViewDataBuilder.meta(attachmentMeta.meta!);
    }

    return attachmentMetaViewDataBuilder.build();
  }

  static AttachmentMeta toAttachmentMeta(
      AttachmentMetaViewData attachmentMetaViewData) {
    return AttachmentMeta(
      url: attachmentMetaViewData.url,
      format: attachmentMetaViewData.format,
      size: attachmentMetaViewData.size,
      duration: attachmentMetaViewData.duration,
      pageCount: attachmentMetaViewData.pageCount,
      ogTags: attachmentMetaViewData.ogTags != null
          ? OgTagsViewDataConvertor.toOgTags(attachmentMetaViewData.ogTags!)
          : null,
      aspectRatio: attachmentMetaViewData.aspectRatio,
      width: attachmentMetaViewData.width,
      height: attachmentMetaViewData.height,
      meta: attachmentMetaViewData.meta,
    );
  }
}
