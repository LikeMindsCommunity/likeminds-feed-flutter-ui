import 'package:likeminds_feed/likeminds_feed.dart';

class GroupTagViewData {
  String? description;
  String? imageUrl;
  String? name;
  String? route;
  String? tag;

  GroupTagViewData._({
    this.description,
    this.imageUrl,
    this.name,
    this.route,
    this.tag,
  });
}

class GroupTagViewDataBuilder {
  String? _description;
  String? _imageUrl;
  String? _name;
  String? _route;
  String? _tag;

  void description(String description) {
    _description = description;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void name(String name) {
    _name = name;
  }

  void route(String route) {
    _route = route;
  }

  void tag(String tag) {
    _tag = tag;
  }

  GroupTagViewData build() {
    return GroupTagViewData._(
      description: _description,
      imageUrl: _imageUrl,
      name: _name,
      route: _route,
      tag: _tag,
    );
  }
}
