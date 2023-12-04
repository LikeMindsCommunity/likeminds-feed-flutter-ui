import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/models/user/user_view_data.dart';
import 'package:lm_feed_ui_example/convertors/sdk/sdk_client_info_convertor.dart';

class UserViewDataConvertor {
  static UserViewData fromUser(User user) {
    UserViewDataBuilder userViewDataBuilder = UserViewDataBuilder();

    userViewDataBuilder.id(user.id);

    userViewDataBuilder.name(user.name);

    userViewDataBuilder.imageUrl(user.imageUrl);

    if (user.isGuest != null) {
      userViewDataBuilder.isGuest(user.isGuest!);
    }

    if (user.isDeleted != null) {
      userViewDataBuilder.isDeleted(user.isDeleted!);
    }

    userViewDataBuilder.userUniqueId(user.userUniqueId);
    if (user.organisationName != null) {
      userViewDataBuilder.organisationName(user.organisationName!);
    }

    if (user.sdkClientInfo != null) {
      userViewDataBuilder.sdkClientInfo(
          SDKClientInfoViewDataConvertor.fromSDKClientInfo(
              user.sdkClientInfo!));
    }
    if (user.updatedAt != null) {
      userViewDataBuilder.updatedAt(user.updatedAt!);
    }
    if (user.isOwner != null) {
      userViewDataBuilder.isOwner(user.isOwner!);
    }
    if (user.customTitle != null) {
      userViewDataBuilder.customTitle(user.customTitle!);
    }
    if (user.memberSince != null) {
      userViewDataBuilder.memberSince(user.memberSince!);
    }
    if (user.route != null) {
      userViewDataBuilder.route(user.route!);
    }
    if (user.state != null) {
      userViewDataBuilder.state(user.state!);
    }
    if (user.communityId != null) {
      userViewDataBuilder.communityId(user.communityId!);
    }
    if (user.createdAt != null) {
      userViewDataBuilder.createdAt(user.createdAt!);
    }

    return userViewDataBuilder.build();
  }

  static User toUser(UserViewData userViewData) {
    return User(
      id: userViewData.id,
      name: userViewData.name,
      imageUrl: userViewData.imageUrl,
      isGuest: userViewData.isGuest,
      userUniqueId: userViewData.userUniqueId,
      organisationName: userViewData.organisationName,
      sdkClientInfo: userViewData.sdkClientInfo != null
          ? SDKClientInfoViewDataConvertor.toSDKClientInfo(
              userViewData.sdkClientInfo!)
          : null,
      updatedAt: userViewData.updatedAt,
      isOwner: userViewData.isOwner,
      customTitle: userViewData.customTitle,
      memberSince: userViewData.memberSince,
      route: userViewData.route,
      state: userViewData.state,
      communityId: userViewData.communityId,
      createdAt: userViewData.createdAt,
      isDeleted: userViewData.isDeleted,
    );
  }
}
