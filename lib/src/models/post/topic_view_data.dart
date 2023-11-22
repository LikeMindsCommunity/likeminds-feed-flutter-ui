import 'package:likeminds_feed/likeminds_feed.dart';

class TopicViewData {
  String name;
  String id;
  bool isEnabled;

  TopicViewData._({required this.name, required this.id, required this.isEnabled});

  factory TopicViewData.fromTopic(Topic topic) {
    return TopicViewData._(
        name: topic.name, id: topic.id, isEnabled: topic.isEnabled);
  }

  Topic toTopic() =>
      Topic.fromEntity(TopicEntity(name: name, id: id, isEnabled: isEnabled));
}

class TopicViewDataBuilder {
  String? _name;
  String? _id;
  bool? _isEnabled;

  void name(String name) {
    _name = name;
  }

  void id(String id) {
    _id = id;
  }

  void isEnabled(bool isEnabled) {
    _isEnabled = isEnabled;
  }

  TopicViewData build() {
    if (_name == null || _id == null || _isEnabled == null) {
      throw Exception("TopicViewDataBuilder: name, id and isEnabled must be set");
    }
    return TopicViewData._(name: _name!, id: _id!, isEnabled: _isEnabled!);
  }
}
