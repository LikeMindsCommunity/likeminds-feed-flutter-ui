import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:lm_feed_ui_example/convertors/sdk/sdk_client_info_convertor.dart';

class UserTagViewDataConvertor {
  static UserTagViewData fromUserTag(UserTag userTag) {
    UserTagViewDataBuilder userTagViewDataBuilder = UserTagViewDataBuilder();

    if (userTag.name != null) {
      userTagViewDataBuilder.name(userTag.name!);
    }

    if (userTag.imageUrl != null) {
      userTagViewDataBuilder.imageUrl(userTag.imageUrl!);
    }

    if (userTag.customTitle != null) {
      userTagViewDataBuilder.customTitle(userTag.customTitle!);
    }

    if (userTag.id != null) {
      userTagViewDataBuilder.id(userTag.id!);
    }

    if (userTag.isGuest != null) {
      userTagViewDataBuilder.isGuest(userTag.isGuest!);
    }

    if (userTag.userUniqueId != null) {
      userTagViewDataBuilder.userUniqueId(userTag.userUniqueId!);
    }

    if (userTag.sdkClientInfo != null) {
      userTagViewDataBuilder.sdkClientInfo(
          SDKClientInfoViewDataConvertor.fromSDKClientInfo(
              userTag.sdkClientInfo!));
    }

    return userTagViewDataBuilder.build();
  }

  static UserTag toUserTag(UserTagViewData userTagViewData) {
    return UserTag(
      name: userTagViewData.name,
      imageUrl: userTagViewData.imageUrl,
      customTitle: userTagViewData.customTitle,
      id: userTagViewData.id,
      isGuest: userTagViewData.isGuest,
      userUniqueId: userTagViewData.userUniqueId,
      sdkClientInfo: userTagViewData.sdkClientInfo != null
          ? SDKClientInfoViewDataConvertor.toSDKClientInfo(
              userTagViewData.sdkClientInfo!)
          : null,
    );
  }
}
