import 'package:likeminds_feed/likeminds_feed.dart';

class TopicUI {
  String name;
  String id;
  bool isEnabled;

  TopicUI._({required this.name, required this.id, required this.isEnabled});

  factory TopicUI.fromTopic(Topic topic) {
    return TopicUI._(
        name: topic.name, id: topic.id, isEnabled: topic.isEnabled);
  }

  Topic toTopic() =>
      Topic.fromEntity(TopicEntity(name: name, id: id, isEnabled: isEnabled));
}

class TopicUIBuilder {
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

  TopicUI build() {
    if (_name == null || _id == null || _isEnabled == null) {
      throw Exception("TopicUIBuilder: name, id and isEnabled must be set");
    }
    return TopicUI._(name: _name!, id: _id!, isEnabled: _isEnabled!);
  }
}
