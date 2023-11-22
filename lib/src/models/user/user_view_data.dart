import 'package:likeminds_feed_ui_fl/src/models/sdk/sdk_client_info_view_data.dart';

class UserViewData {
  int id;
  String name;
  String imageUrl;
  bool? isGuest;
  bool? isDeleted;
  String userUniqueId;
  String? organisationName;
  SDKClientInfoViewData? sdkClientInfo;
  int? updatedAt;
  bool? isOwner;
  String? customTitle;
  String? memberSince;
  String? route;
  int? state;
  int? communityId;
  int? createdAt;

  UserViewData._({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isGuest,
    required this.userUniqueId,
    this.organisationName,
    this.sdkClientInfo,
    this.updatedAt,
    this.isOwner,
    this.customTitle,
    this.memberSince,
    this.route,
    this.state,
    this.communityId,
    this.createdAt,
    this.isDeleted,
  });
}

class UserViewDataBuilder {
  int? _id;
  String? _name;
  String? _imageUrl;
  bool? _isGuest;
  bool? _isDeleted;
  String? _userUniqueId;
  String? _organisationName;
  SDKClientInfoViewData? _sdkClientInfo;
  int? _updatedAt;
  bool? _isOwner;
  String? _customTitle;
  String? _memberSince;
  String? _route;
  int? _state;
  int? _communityId;
  int? _createdAt;

  void id(int id) {
    _id = id;
  }

  void name(String name) {
    _name = name;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void isGuest(bool isGuest) {
    _isGuest = isGuest;
  }

  void isDeleted(bool isDeleted) {
    _isDeleted = isDeleted;
  }

  void userUniqueId(String userUniqueId) {
    _userUniqueId = userUniqueId;
  }

  void organisationName(String organisationName) {
    _organisationName = organisationName;
  }

  void sdkClientInfo(SDKClientInfoViewData sdkClientInfo) {
    _sdkClientInfo = sdkClientInfo;
  }

  void updatedAt(int updatedAt) {
    _updatedAt = updatedAt;
  }

  void isOwner(bool isOwner) {
    _isOwner = isOwner;
  }

  void customTitle(String customTitle) {
    _customTitle = customTitle;
  }

  void memberSince(String memberSince) {
    _memberSince = memberSince;
  }

  void route(String route) {
    _route = route;
  }

  void state(int state) {
    _state = state;
  }

  void communityId(int communityId) {
    _communityId = communityId;
  }

  void createdAt(int createdAt) {
    _createdAt = createdAt;
  }

  UserViewData build() {
    return UserViewData._(
      id: _id!,
      name: _name!,
      imageUrl: _imageUrl!,
      isGuest: _isGuest,
      userUniqueId: _userUniqueId!,
      organisationName: _organisationName,
      sdkClientInfo: _sdkClientInfo,
      updatedAt: _updatedAt,
      isOwner: _isOwner,
      customTitle: _customTitle,
      memberSince: _memberSince,
      route: _route,
      state: _state,
      communityId: _communityId,
      createdAt: _createdAt,
      isDeleted: _isDeleted,
    );
  }
}
