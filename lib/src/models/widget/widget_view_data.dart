import 'package:likeminds_feed/likeminds_feed.dart';

class WidgetViewData {
  final String id;
  Map<String, dynamic>? lmMeta;
  int createdAt;
  Map<String, dynamic> metadata;
  String parentEntityId;
  String parentEntityType;
  int updatedAt;

  WidgetViewData._({
    required this.id,
    this.lmMeta,
    required this.createdAt,
    required this.metadata,
    required this.parentEntityId,
    required this.parentEntityType,
    required this.updatedAt,
  });
}

class WidgetViewDataBuilder {
  String? _id;
  Map<String, dynamic>? _lmMeta;
  int? _createdAt;
  Map<String, dynamic>? _metadata;
  String? _parentEntityId;
  String? _parentEntityType;
  int? _updatedAt;

  void id(String id) {
    _id = id;
  }

  void lmMeta(Map<String, dynamic> lmMeta) {
    _lmMeta = lmMeta;
  }

  void createdAt(int createdAt) {
    _createdAt = createdAt;
  }

  void metadata(Map<String, dynamic> metadata) {
    _metadata = metadata;
  }

  void parentEntityId(String parentEntityId) {
    _parentEntityId = parentEntityId;
  }

  void parentEntityType(String parentEntityType) {
    _parentEntityType = parentEntityType;
  }

  void updatedAt(int updatedAt) {
    _updatedAt = updatedAt;
  }

  WidgetViewData build() {
    return WidgetViewData._(
      id: _id!,
      lmMeta: _lmMeta,
      createdAt: _createdAt!,
      metadata: _metadata!,
      parentEntityId: _parentEntityId!,
      parentEntityType: _parentEntityType!,
      updatedAt: _updatedAt!,
    );
  }
}
