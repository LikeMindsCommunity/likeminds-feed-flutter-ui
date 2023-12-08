import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';

class WidgetViewDataConvertor {
  static WidgetViewData fromWidgetModel(WidgetModel data) {
    WidgetViewDataBuilder widgetViewDataBuilder = WidgetViewDataBuilder();

    widgetViewDataBuilder.id(data.id);

    if (data.lmMeta != null) {
      widgetViewDataBuilder.lmMeta(data.lmMeta!);
    }

    widgetViewDataBuilder.createdAt(data.createdAt);

    widgetViewDataBuilder.metadata(data.metadata);

    widgetViewDataBuilder.parentEntityId(data.parentEntityId);

    widgetViewDataBuilder.parentEntityType(data.parentEntityType);

    widgetViewDataBuilder.updatedAt(data.updatedAt);

    return widgetViewDataBuilder.build();
  }

  static WidgetModel toWidgetModel(WidgetViewData data) {
    return WidgetModel(
      id: data.id,
      lmMeta: data.lmMeta,
      createdAt: data.createdAt,
      metadata: data.metadata,
      parentEntityId: data.parentEntityId,
      parentEntityType: data.parentEntityType,
      updatedAt: data.updatedAt,
    );
  }
}
