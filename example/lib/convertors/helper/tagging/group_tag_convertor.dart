import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/models/helper/tagging/group_tag_view_data.dart';

class GroupTagViewDataConvertor {
  static GroupTagViewData fromGroupTag(GroupTag groupTag) {
    GroupTagViewDataBuilder groupTagViewDataBuilder = GroupTagViewDataBuilder();

    if (groupTag.description != null) {
      groupTagViewDataBuilder.description(groupTag.description!);
    }

    if (groupTag.imageUrl != null) {
      groupTagViewDataBuilder.imageUrl(groupTag.imageUrl!);
    }

    if (groupTag.name != null) {
      groupTagViewDataBuilder.name(groupTag.name!);
    }

    if (groupTag.route != null) {
      groupTagViewDataBuilder.route(groupTag.route!);
    }

    if (groupTag.tag != null) {
      groupTagViewDataBuilder.tag(groupTag.tag!);
    }

    return groupTagViewDataBuilder.build();
  }

  static GroupTag toGroupTag(GroupTagViewData groupTagViewData) {
    return GroupTag(
      description: groupTagViewData.description,
      imageUrl: groupTagViewData.imageUrl,
      name: groupTagViewData.name,
      route: groupTagViewData.route,
      tag: groupTagViewData.tag,
    );
  }
}
