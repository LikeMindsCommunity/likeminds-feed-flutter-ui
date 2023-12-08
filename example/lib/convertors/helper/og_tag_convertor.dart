import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';

class OgTagsViewDataConvertor {
  static OgTagsViewData fromOgTags(OgTags ogTags) {
    OgTagsViewDataBuilder ogTagsViewDataBuilder = OgTagsViewDataBuilder();

    if (ogTags.title != null) {
      ogTagsViewDataBuilder.title(ogTags.title!);
    }

    if (ogTags.image != null) {
      ogTagsViewDataBuilder.image(ogTags.image!);
    }

    if (ogTags.description != null) {
      ogTagsViewDataBuilder.description(ogTags.description!);
    }

    if (ogTags.url != null) {
      ogTagsViewDataBuilder.url(ogTags.url!);
    }

    return ogTagsViewDataBuilder.build();
  }

  static OgTags toOgTags(OgTagsViewData ogTagsViewData) {
    return OgTags(
      title: ogTagsViewData.title,
      image: ogTagsViewData.image,
      description: ogTagsViewData.description,
      url: ogTagsViewData.url,
    );
  }
}
