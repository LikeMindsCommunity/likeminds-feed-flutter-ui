import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/models/commons/popup_menu_view_data.dart';

class PopupMenuItemConvertor {
  static PopUpMenuItemViewData fromPopUpMenuItemModel({
    required PopupMenuItemModel item,
  }) {
    PopUpMenuItemViewDataBuilder popUpMenuItemViewDataBuilder =
        PopUpMenuItemViewDataBuilder();
    popUpMenuItemViewDataBuilder
      ..title(item.title)
      ..id(item.id);
    return popUpMenuItemViewDataBuilder.build();
  }

  static PopupMenuItemModel toPopUpMenuItemModel(
      PopUpMenuItemViewData popUpMenuItemViewData) {
    return PopupMenuItemModel(
      title: popUpMenuItemViewData.title,
      id: popUpMenuItemViewData.id,
    );
  }
}
