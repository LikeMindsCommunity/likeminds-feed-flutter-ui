import 'package:likeminds_feed_ui_fl/src/models/notification_feed/activity_entity_view_data.dart';

class NotificationFeedItemViewData {
  String id;
  int action;
  List<String> actionBy;
  String actionOn;
  ActivityEntityViewData activityEntityData;
  String activityText;
  String? cta;
  int createdAt;
  String entityId;
  String? entityOwnerId;
  int entityType;
  bool isRead;
  int updatedAt;

  NotificationFeedItemViewData._({
    required this.id,
    required this.action,
    required this.actionBy,
    required this.actionOn,
    required this.activityEntityData,
    required this.activityText,
    this.cta,
    required this.createdAt,
    required this.entityId,
    this.entityOwnerId,
    required this.entityType,
    required this.isRead,
    required this.updatedAt,
  });
}

class NotificationFeedItemViewDataBuilder {
  String? _id;
  int? _action;
  List<String>? _actionBy;
  String? _actionOn;
  ActivityEntityViewData? _activityEntityData;
  String? _activityText;
  String? _cta;
  int? _createdAt;
  String? _entityId;
  String? _entityOwnerId;
  int? _entityType;
  bool? _isRead;
  int? _updatedAt;

  void id(String id) {
    _id = id;
  }

  void action(int action) {
    _action = action;
  }

  void actionBy(List<String> actionBy) {
    _actionBy = actionBy;
  }

  void actionOn(String actionOn) {
    _actionOn = actionOn;
  }

  void activityEntityViewData(ActivityEntityViewData activityEntityData) {
    _activityEntityData = activityEntityData;
  }

  void activityText(String activityText) {
    _activityText = activityText;
  }

  void cta(String cta) {
    _cta = cta;
  }

  void createdAt(int createdAt) {
    _createdAt = createdAt;
  }

  void entityId(String entityId) {
    _entityId = entityId;
  }

  void entityOwnerId(String entityOwnerId) {
    _entityOwnerId = entityOwnerId;
  }

  void entityType(int entityType) {
    _entityType = entityType;
  }

  void isRead(bool isRead) {
    _isRead = isRead;
  }

  void updatedAt(int updatedAt) {
    _updatedAt = updatedAt;
  }

  NotificationFeedItemViewData build() {
    return NotificationFeedItemViewData._(
      id: _id!,
      action: _action!,
      actionBy: _actionBy!,
      actionOn: _actionOn!,
      activityEntityData: _activityEntityData!,
      activityText: _activityText!,
      cta: _cta,
      createdAt: _createdAt!,
      entityId: _entityId!,
      entityOwnerId: _entityOwnerId,
      entityType: _entityType!,
      isRead: _isRead!,
      updatedAt: _updatedAt!,
    );
  }
}
