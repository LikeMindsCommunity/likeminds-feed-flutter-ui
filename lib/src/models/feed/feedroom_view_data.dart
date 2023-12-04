import 'package:likeminds_feed_ui_fl/src/models/user/user_view_data.dart';

class FeedRoomViewData {
  int id;
  String title;
  String header;
  String date;
  int? dateEpoch;
  int? dateTime;
  int? duration;
  String? cardCreationTime;
  String? shareLink;
  String? thirdPartyUniqueId;
  int state;
  bool? isPrivate;
  bool? isSecret;
  bool? isPending;
  bool? isPrivateMember;
  bool? isTagged;
  bool? isGuest;
  bool? isPaid;
  bool? isPinned;
  bool? isEdited;
  bool? hasBeenNamed;
  bool? autoFollowDone;
  bool? includeMembersLater;
  bool? accessWithoutSubscription;
  bool? externalSeen;
  bool? showFollowTelescope;
  bool? showFollowAutoTag;
  bool? memberCanMessage;
  bool? muteStatus;
  bool? followStatus;
  int communityId;
  String? communityName;
  String? chatroomImageUrl;
  int? onlineLinkEnableBefore;
  String? onlineLinkType;
  int participantsCount;
  int? memberId;
  String? access;
  UserViewData member;
  List<dynamic>? cohorts;
  List<dynamic>? coHosts;

  FeedRoomViewData._({
    required this.id,
    required this.title,
    required this.header,
    required this.date,
    this.dateEpoch,
    this.dateTime,
    this.duration,
    this.cardCreationTime,
    this.shareLink,
    this.thirdPartyUniqueId,
    required this.state,
    this.isPrivate,
    this.isSecret,
    this.isPending,
    this.isPrivateMember,
    this.isTagged,
    this.isGuest,
    this.isPaid,
    this.isPinned,
    this.isEdited,
    this.hasBeenNamed,
    this.autoFollowDone,
    this.includeMembersLater,
    this.accessWithoutSubscription,
    this.externalSeen,
    this.showFollowTelescope,
    this.showFollowAutoTag,
    this.memberCanMessage,
    this.muteStatus,
    this.followStatus,
    required this.communityId,
    this.communityName,
    this.chatroomImageUrl,
    this.onlineLinkEnableBefore,
    this.onlineLinkType,
    required this.participantsCount,
    this.memberId,
    this.access,
    required this.member,
    this.cohorts,
    this.coHosts,
  });
}

class FeedRoomViewDataBuilder {
  int? _id;
  String? _title;
  String? _header;
  String? _date;
  int? _dateEpoch;
  int? _dateTime;
  int? _duration;
  String? _cardCreationTime;
  String? _shareLink;
  String? _thirdPartyUniqueId;
  int? _state;
  bool? _isPrivate;
  bool? _isSecret;
  bool? _isPending;
  bool? _isPrivateMember;
  bool? _isTagged;
  bool? _isGuest;
  bool? _isPaid;
  bool? _isPinned;
  bool? _isEdited;
  bool? _hasBeenNamed;
  bool? _autoFollowDone;
  bool? _includeMembersLater;
  bool? _accessWithoutSubscription;
  bool? _externalSeen;
  bool? _showFollowTelescope;
  bool? _showFollowAutoTag;
  bool? _memberCanMessage;
  bool? _muteStatus;
  bool? _followStatus;
  int? _communityId;
  String? _communityName;
  String? _chatroomImageUrl;
  int? _onlineLinkEnableBefore;
  String? _onlineLinkType;
  int? _participantsCount;
  int? _memberId;
  String? _access;
  UserViewData? _member;
  List<dynamic>? _cohorts;
  List<dynamic>? _coHosts;

  void id(int id) {
    _id = id;
  }

  void title(String title) {
    _title = title;
  }

  void header(String header) {
    _header = header;
  }

  void date(String date) {
    _date = date;
  }

  void dateEpoch(int dateEpoch) {
    _dateEpoch = dateEpoch;
  }

  void dateTime(int dateTime) {
    _dateTime = dateTime;
  }

  void duration(int duration) {
    _duration = duration;
  }

  void cardCreationTime(String cardCreationTime) {
    _cardCreationTime = cardCreationTime;
  }

  void shareLink(String shareLink) {
    _shareLink = shareLink;
  }

  void thirdPartyUniqueId(String thirdPartyUniqueId) {
    _thirdPartyUniqueId = thirdPartyUniqueId;
  }

  void state(int state) {
    _state = state;
  }

  void isPrivate(bool isPrivate) {
    _isPrivate = isPrivate;
  }

  void isSecret(bool isSecret) {
    _isSecret = isSecret;
  }

  void isPending(bool isPending) {
    _isPending = isPending;
  }

  void isPrivateMember(bool isPrivateMember) {
    _isPrivateMember = isPrivateMember;
  }

  void isTagged(bool isTagged) {
    _isTagged = isTagged;
  }

  void isGuest(bool isGuest) {
    _isGuest = isGuest;
  }

  void isPaid(bool isPaid) {
    _isPaid = isPaid;
  }

  void isPinned(bool isPinned) {
    _isPinned = isPinned;
  }

  void isEdited(bool isEdited) {
    _isEdited = isEdited;
  }

  void hasBeenNamed(bool hasBeenNamed) {
    _hasBeenNamed = hasBeenNamed;
  }

  void autoFollowDone(bool autoFollowDone) {
    _autoFollowDone = autoFollowDone;
  }

  void includeMembersLater(bool includeMembersLater) {
    _includeMembersLater = includeMembersLater;
  }

  void accessWithoutSubscription(bool accessWithoutSubscription) {
    _accessWithoutSubscription = accessWithoutSubscription;
  }

  void externalSeen(bool externalSeen) {
    _externalSeen = externalSeen;
  }

  void showFollowTelescope(bool showFollowTelescope) {
    _showFollowTelescope = showFollowTelescope;
  }

  void showFollowAutoTag(bool showFollowAutoTag) {
    _showFollowAutoTag = showFollowAutoTag;
  }

  void memberCanMessage(bool memberCanMessage) {
    _memberCanMessage = memberCanMessage;
  }

  void muteStatus(bool muteStatus) {
    _muteStatus = muteStatus;
  }

  void followStatus(bool followStatus) {
    _followStatus = followStatus;
  }

  void communityId(int communityId) {
    _communityId = communityId;
  }

  void communityName(String communityName) {
    _communityName = communityName;
  }

  void chatroomImageUrl(String chatroomImageUrl) {
    _chatroomImageUrl = chatroomImageUrl;
  }

  void onlineLinkEnableBefore(int onlineLinkEnableBefore) {
    _onlineLinkEnableBefore = onlineLinkEnableBefore;
  }

  void onlineLinkType(String onlineLinkType) {
    _onlineLinkType = onlineLinkType;
  }

  void participantsCount(int participantsCount) {
    _participantsCount = participantsCount;
  }

  void memberId(int memberId) {
    _memberId = memberId;
  }

  void access(String access) {
    _access = access;
  }

  void member(UserViewData member) {
    _member = member;
  }

  void cohorts(List<dynamic> cohorts) {
    _cohorts = cohorts;
  }

  void coHosts(List<dynamic> coHosts) {
    _coHosts = coHosts;
  }

  FeedRoomViewData build() {
    return FeedRoomViewData._(
      id: _id!,
      title: _title!,
      header: _header!,
      date: _date!,
      dateEpoch: _dateEpoch,
      dateTime: _dateTime,
      duration: _duration,
      cardCreationTime: _cardCreationTime,
      shareLink: _shareLink,
      thirdPartyUniqueId: _thirdPartyUniqueId,
      state: _state!,
      isPrivate: _isPrivate,
      isSecret: _isSecret,
      isPending: _isPending,
      isPrivateMember: _isPrivateMember,
      isTagged: _isTagged,
      isGuest: _isGuest,
      isPaid: _isPaid,
      isPinned: _isPinned,
      isEdited: _isEdited,
      hasBeenNamed: _hasBeenNamed,
      autoFollowDone: _autoFollowDone,
      includeMembersLater: _includeMembersLater,
      accessWithoutSubscription: _accessWithoutSubscription,
      externalSeen: _externalSeen,
      showFollowTelescope: _showFollowTelescope,
      showFollowAutoTag: _showFollowAutoTag,
      memberCanMessage: _memberCanMessage,
      communityId: _communityId!,
      communityName: _communityName,
      chatroomImageUrl: _chatroomImageUrl,
      onlineLinkEnableBefore: _onlineLinkEnableBefore,
      onlineLinkType: _onlineLinkType,
      participantsCount: _participantsCount!,
      memberId: _memberId,
      access: _access,
      member: _member!,
      cohorts: _cohorts,
      coHosts: _coHosts,
      followStatus: _followStatus,
      muteStatus: _muteStatus,
    );
  }
}
