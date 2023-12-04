class SDKClientInfoViewData {
  int community;
  int user;
  String userUniqueId;

  SDKClientInfoViewData._({
    required this.community,
    required this.user,
    required this.userUniqueId,
  });
}

class SDKClientInfoViewDataBuilder {
  int? _community;
  int? _user;
  String? _userUniqueId;

  void community(int community) {
    _community = community;
  }

  void user(int user) {
    _user = user;
  }

  void userUniqueId(String userUniqueId) {
    _userUniqueId = userUniqueId;
  }

  SDKClientInfoViewData build() {
    return SDKClientInfoViewData._(
      community: _community!,
      user: _user!,
      userUniqueId: _userUniqueId!,
    );
  }
}
