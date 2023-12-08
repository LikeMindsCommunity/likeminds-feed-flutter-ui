import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';

class SDKClientInfoViewDataConvertor {
  static SDKClientInfoViewData fromSDKClientInfo(SDKClientInfo sdkClientInfo) {
    SDKClientInfoViewDataBuilder sdkClientInfoViewDataBuilder =
        SDKClientInfoViewDataBuilder();

    sdkClientInfoViewDataBuilder.community(sdkClientInfo.community);

    sdkClientInfoViewDataBuilder.user(sdkClientInfo.user);

    sdkClientInfoViewDataBuilder.userUniqueId(sdkClientInfo.userUniqueId);

    return sdkClientInfoViewDataBuilder.build();
  }

  static SDKClientInfo toSDKClientInfo(
      SDKClientInfoViewData sdkClientInfoViewData) {
    return SDKClientInfo(
      community: sdkClientInfoViewData.community,
      user: sdkClientInfoViewData.user,
      userUniqueId: sdkClientInfoViewData.userUniqueId,
    );
  }
}
