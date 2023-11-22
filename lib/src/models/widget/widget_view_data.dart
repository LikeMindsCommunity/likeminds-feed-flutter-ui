import 'package:likeminds_feed/likeminds_feed.dart';

class WidgetViewData {
  String id;
  Map<String, dynamic>? lmMeta;
  int createdAt;
  Map<String, dynamic> metadata;
  String parentEntityId;
  String parentEntityType;
  int updatedAt;

  WidgetViewData({
    required this.id,
    this.lmMeta,
    required this.createdAt,
    required this.metadata,
    required this.parentEntityId,
    required this.parentEntityType,
    required this.updatedAt,
  });

  factory WidgetViewData.fromWidgetModel(WidgetModel data) {
    return WidgetViewData(
      id: data.id,
      lmMeta: data.lmMeta,
      createdAt: data.createdAt,
      metadata: data.metadata,
      parentEntityId: data.parentEntityId,
      parentEntityType: data.parentEntityType,
      updatedAt: data.updatedAt,
    );
  }

  WidgetModel toWidgetModel(){
    return WidgetModel(
      id: id,
      lmMeta: lmMeta,
      createdAt: createdAt,
      metadata: metadata,
      parentEntityId: parentEntityId,
      parentEntityType: parentEntityType,
      updatedAt: updatedAt,
    );
  }
}
