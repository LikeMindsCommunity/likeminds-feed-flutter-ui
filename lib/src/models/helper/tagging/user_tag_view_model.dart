import 'package:likeminds_feed_ui_fl/src/models/sdk/sdk_client_info_view_data.dart';

class UserTagViewData {
  String? name;
  String? imageUrl;
  String? customTitle;
  int? id;
  bool? isGuest;
  String? userUniqueId;
  SDKClientInfoViewData? sdkClientInfo;

  UserTagViewData._({
    this.name,
    this.imageUrl,
    this.customTitle,
    this.id,
    this.isGuest,
    this.userUniqueId,
    this.sdkClientInfo,
  });
}

class UserTagViewDataBuilder {
  String? _name;
  String? _imageUrl;
  String? _customTitle;
  int? _id;
  bool? _isGuest;
  String? _userUniqueId;
  SDKClientInfoViewData? _sdkClientInfo;

  void name(String name) {
    _name = name;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void customTitle(String customTitle) {
    _customTitle = customTitle;
  }

  void id(int id) {
    _id = id;
  }

  void isGuest(bool isGuest) {
    _isGuest = isGuest;
  }

  void userUniqueId(String userUniqueId) {
    _userUniqueId = userUniqueId;
  }

  void sdkClientInfo(SDKClientInfoViewData sdkClientInfo) {
    _sdkClientInfo = sdkClientInfo;
  }

  UserTagViewData build() {
    return UserTagViewData._(
      name: _name,
      imageUrl: _imageUrl,
      customTitle: _customTitle,
      id: _id,
      isGuest: _isGuest,
      userUniqueId: _userUniqueId,
      sdkClientInfo: _sdkClientInfo,
    );
  }
}
