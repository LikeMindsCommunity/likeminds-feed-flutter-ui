import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/models/notification_feed/notification_feed_item_view_data.dart';
import 'package:lm_feed_ui_example/convertors/notification_feed/activity_entity_convertor.dart';

class NotificationFeedItemViewDataConvertor {
  static NotificationFeedItemViewData fromNotificationFeedItem(
      NotificationFeedItem notificationFeedItem) {
    NotificationFeedItemViewDataBuilder notificationFeedItemViewDataBuilder =
        NotificationFeedItemViewDataBuilder();

    notificationFeedItemViewDataBuilder.id(notificationFeedItem.id);

    notificationFeedItemViewDataBuilder.action(notificationFeedItem.action);

    notificationFeedItemViewDataBuilder.actionBy(notificationFeedItem.actionBy);

    notificationFeedItemViewDataBuilder.actionOn(notificationFeedItem.actionOn);

    notificationFeedItemViewDataBuilder.activityEntityData(
        ActivityEntityViewDataConvertor.fromActivityEntity(
            notificationFeedItem.activityEntityData));

    notificationFeedItemViewDataBuilder
        .activityText(notificationFeedItem.activityText);

    if (notificationFeedItem.cta != null) {
      notificationFeedItemViewDataBuilder.cta(notificationFeedItem.cta!);
    }

    notificationFeedItemViewDataBuilder
        .createdAt(notificationFeedItem.createdAt);

    notificationFeedItemViewDataBuilder.entityId(notificationFeedItem.entityId);

    if (notificationFeedItem.entityOwnerId != null) {
      notificationFeedItemViewDataBuilder
          .entityOwnerId(notificationFeedItem.entityOwnerId!);
    }

    notificationFeedItemViewDataBuilder
        .entityType(notificationFeedItem.entityType);

    notificationFeedItemViewDataBuilder.isRead(notificationFeedItem.isRead);

    notificationFeedItemViewDataBuilder
        .updatedAt(notificationFeedItem.updatedAt);

    return notificationFeedItemViewDataBuilder.build();
  }

  static NotificationFeedItem toNotificationFeedItem(
      NotificationFeedItemViewData notificationFeedItemViewData) {
    return NotificationFeedItem(
      id: notificationFeedItemViewData.id,
      action: notificationFeedItemViewData.action,
      actionBy: notificationFeedItemViewData.actionBy,
      actionOn: notificationFeedItemViewData.actionOn,
      activityEntityData: ActivityEntityViewDataConvertor.toActivityEntity(
          notificationFeedItemViewData.activityEntityData),
      activityText: notificationFeedItemViewData.activityText,
      createdAt: notificationFeedItemViewData.createdAt,
      cta: notificationFeedItemViewData.cta,
      entityId: notificationFeedItemViewData.entityId,
      entityOwnerId: notificationFeedItemViewData.entityOwnerId,
      entityType: notificationFeedItemViewData.entityType,
      isRead: notificationFeedItemViewData.isRead,
      updatedAt: notificationFeedItemViewData.updatedAt,
    );
  }
}
