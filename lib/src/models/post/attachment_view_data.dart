import 'package:likeminds_feed_ui_fl/src/models/post/og_tags_view_data.dart';

class AttachmentViewData {
  final int attachmentType;
  final AttachmentMetaViewData attachmentMeta;

  AttachmentViewData({
    required this.attachmentType,
    required this.attachmentMeta,
  });
}

class AttachmentMetaViewData {
  final String? url;
  final String? format;
  final int? size;
  final int? duration;
  final int? pageCount;
  final OgTagsViewData? ogTags;
  final double? height;
  final double? width;
  final double? aspectRatio;
  final Map<String, dynamic>? meta;

  AttachmentMetaViewData({
    this.url,
    this.format,
    this.size,
    this.duration,
    this.pageCount,
    this.ogTags,
    this.aspectRatio,
    this.width,
    this.height,
    this.meta,
  });
}
