import 'package:likeminds_feed/likeminds_feed.dart';

import 'package:likeminds_feed_ui_fl/src/models/notification_feed/activity_entity_view_data.dart';
import 'package:lm_feed_ui_example/convertors/comment/comment_convertor.dart';
import 'package:lm_feed_ui_example/convertors/helper/attachment/attachment_convertor.dart';

class ActivityEntityViewDataConvertor {
  static ActivityEntityViewData fromActivityEntity(
      ActivityEntityData activityEntityData) {
    ActivityEntityViewDataBuilder activityEntityViewDataBuilder =
        ActivityEntityViewDataBuilder();

    activityEntityViewDataBuilder.id(activityEntityData.id);

    if (activityEntityData.attachments != null) {
      activityEntityViewDataBuilder.attachments(activityEntityData.attachments!
          .map((e) => AttachmentViewDataConvertor.fromAttachment(attachment: e))
          .toList());
    }

    if (activityEntityData.chatroomId != null) {
      activityEntityViewDataBuilder.chatroomId(activityEntityData.chatroomId!);
    }

    activityEntityViewDataBuilder.communityId(activityEntityData.communityId);

    activityEntityViewDataBuilder.createdAt(activityEntityData.createdAt);

    if (activityEntityData.deleteReason != null) {
      activityEntityViewDataBuilder
          .deleteReason(activityEntityData.deleteReason!);
    }

    if (activityEntityData.deleteBy != null) {
      activityEntityViewDataBuilder.deleteBy(activityEntityData.deleteBy!);
    }

    if (activityEntityData.heading != null) {
      activityEntityViewDataBuilder.heading(activityEntityData.heading!);
    }

    if (activityEntityData.level != null) {
      activityEntityViewDataBuilder.level(activityEntityData.level!);
    }

    if (activityEntityData.postId != null) {
      activityEntityViewDataBuilder.postId(activityEntityData.postId!);
    }

    if (activityEntityData.isDeleted != null) {
      activityEntityViewDataBuilder.isDeleted(activityEntityData.isDeleted!);
    }

    if (activityEntityData.isPinned != null) {
      activityEntityViewDataBuilder.isPinned(activityEntityData.isPinned!);
    }

    if (activityEntityData.isEdited != null) {
      activityEntityViewDataBuilder.isEdited(activityEntityData.isEdited!);
    }

    activityEntityViewDataBuilder.text(activityEntityData.text);

    if (activityEntityData.replies != null) {
      activityEntityViewDataBuilder.replies(activityEntityData.replies!
          .map((e) => CommentViewDataConvertor.fromReply(e))
          .toList());
    }

    if (activityEntityData.updatedAt != null) {
      activityEntityViewDataBuilder.updatedAt(activityEntityData.updatedAt!);
    }

    activityEntityViewDataBuilder.userId(activityEntityData.userId);

    return activityEntityViewDataBuilder.build();
  }

  static ActivityEntityData toActivityEntity(
      ActivityEntityViewData activityEntityViewData) {
    return ActivityEntityData(
      id: activityEntityViewData.id,
      attachments: activityEntityViewData.attachments
          ?.map((e) => AttachmentViewDataConvertor.toAttachment(e))
          .toList(),
      chatroomId: activityEntityViewData.chatroomId,
      communityId: activityEntityViewData.communityId,
      createdAt: activityEntityViewData.createdAt,
      deleteReason: activityEntityViewData.deleteReason,
      deleteBy: activityEntityViewData.deleteBy,
      heading: activityEntityViewData.heading,
      level: activityEntityViewData.level,
      postId: activityEntityViewData.postId,
      isDeleted: activityEntityViewData.isDeleted,
      isEdited: activityEntityViewData.isEdited,
      isPinned: activityEntityViewData.isPinned,
      replies: activityEntityViewData.replies
          ?.map((e) => CommentViewDataConvertor.toReply(e))
          .toList(),
      text: activityEntityViewData.text,
      updatedAt: activityEntityViewData.updatedAt,
      userId: activityEntityViewData.userId,
    );
  }
}
