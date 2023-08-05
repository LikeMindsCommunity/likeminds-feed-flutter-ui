import 'package:likeminds_feed/likeminds_feed.dart';

class TopicViewModel {
  String name;
  String id;
  bool isEnabled;

  TopicViewModel(
      {required this.name, required this.id, required this.isEnabled});

  factory TopicViewModel.fromTopic(Topic topic) {
    return TopicViewModel(
        name: topic.name, id: topic.id, isEnabled: topic.isEnabled);
  }

  Topic toTopic() =>
      Topic.fromEntity(TopicEntity(name: name, id: id, isEnabled: isEnabled));
}
