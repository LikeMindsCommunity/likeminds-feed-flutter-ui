import 'package:likeminds_feed/likeminds_feed.dart';

class OgTagsViewData {
  final String? title;
  final String? image;
  final String? description;
  final String? url;

  OgTagsViewData({
    this.title,
    this.image,
    this.description,
    this.url,
  });

  factory OgTagsViewData.fromAttachmentsMetaOgTags(
      AttachmentMetaOgTags ogTags) {
    return OgTagsViewData(
      title: ogTags.title,
      image: ogTags.image,
      description: ogTags.description,
      url: ogTags.url,
    );
  }

  AttachmentMetaOgTags toAttachmentMetaOgTags() {
    return AttachmentMetaOgTags(
      title: title,
      image: image,
      description: description,
      url: url,
    );
  }
}
