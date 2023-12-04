import 'package:likeminds_feed_ui_fl/src/models/helper/og_tags_view_data.dart';

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

  AttachmentMetaViewData._({
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

class AttachmentMetaViewDataBuilder {
  String? _url;
  String? _format;
  int? _size;
  int? _duration;
  int? _pageCount;
  OgTagsViewData? _ogTags;
  double? _height;
  double? _width;
  double? _aspectRatio;
  Map<String, dynamic>? _meta;

  void url(String url) {
    _url = url;
  }

  void format(String format) {
    _format = format;
  }

  void size(int size) {
    _size = size;
  }

  void duration(int duration) {
    _duration = duration;
  }

  void pageCount(int pageCount) {
    _pageCount = pageCount;
  }

  void ogTags(OgTagsViewData ogTags) {
    _ogTags = ogTags;
  }

  void height(double height) {
    _height = height;
  }

  void width(double width) {
    _width = width;
  }

  void aspectRatio(double aspectRatio) {
    _aspectRatio = aspectRatio;
  }

  void meta(Map<String, dynamic> meta) {
    _meta = meta;
  }

  AttachmentMetaViewData build() {
    return AttachmentMetaViewData._(
      url: _url,
      format: _format,
      size: _size,
      duration: _duration,
      pageCount: _pageCount,
      ogTags: _ogTags,
      height: _height,
      width: _width,
      aspectRatio: _aspectRatio,
      meta: _meta,
    );
  }
}
