class OgTagsViewData {
  final String? title;
  final String? image;
  final String? description;
  final String? url;

  OgTagsViewData._({
    this.title,
    this.image,
    this.description,
    this.url,
  });
}

class OgTagsViewDataBuilder {
  String? _title;
  String? _image;
  String? _description;
  String? _url;

  void title(String title) {
    _title = title;
  }

  void image(String image) {
    _image = image;
  }

  void description(String description) {
    _description = description;
  }

  void url(String url) {
    _url = url;
  }

  OgTagsViewData build() {
    return OgTagsViewData._(
      title: _title,
      image: _image,
      description: _description,
      url: _url,
    );
  }
}
