import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:lm_feed_ui_example/convertors/user/user_convertor.dart';

class FeedViewDataConvertor {
  static FeedRoomViewData fromFeedRoomModel({required FeedRoom feedRoomModel}) {
    FeedRoomViewDataBuilder feedRoomViewDataBuilder = FeedRoomViewDataBuilder();
    feedRoomViewDataBuilder
      ..id(feedRoomModel.id)
      ..title(feedRoomModel.title)
      ..header(feedRoomModel.header)
      ..date(feedRoomModel.date)
      ..state(feedRoomModel.state)
      ..member(UserViewDataConvertor.fromUser(feedRoomModel.member))
      ..communityId(feedRoomModel.communityId)
      ..participantsCount(feedRoomModel.participantsCount);

    if (feedRoomModel.dateEpoch != null) {
      feedRoomViewDataBuilder.dateEpoch(feedRoomModel.dateEpoch!);
    }

    if (feedRoomModel.dateTime != null) {
      feedRoomViewDataBuilder.dateTime(feedRoomModel.dateTime!);
    }

    if (feedRoomModel.duration != null) {
      feedRoomViewDataBuilder.duration(feedRoomModel.duration!);
    }

    if (feedRoomModel.cardCreationTime != null) {
      feedRoomViewDataBuilder.cardCreationTime(feedRoomModel.cardCreationTime!);
    }

    if (feedRoomModel.shareLink != null) {
      feedRoomViewDataBuilder.shareLink(feedRoomModel.shareLink!);
    }

    if (feedRoomModel.thirdPartyUniqueId != null) {
      feedRoomViewDataBuilder
          .thirdPartyUniqueId(feedRoomModel.thirdPartyUniqueId!);
    }

    if (feedRoomModel.isPrivate != null) {
      feedRoomViewDataBuilder.isPrivate(feedRoomModel.isPrivate!);
    }

    if (feedRoomModel.isSecret != null) {
      feedRoomViewDataBuilder.isSecret(feedRoomModel.isSecret!);
    }

    if (feedRoomModel.isPending != null) {
      feedRoomViewDataBuilder.isPending(feedRoomModel.isPending!);
    }

    if (feedRoomModel.isPrivateMember != null) {
      feedRoomViewDataBuilder.isPrivateMember(feedRoomModel.isPrivateMember!);
    }

    if (feedRoomModel.isTagged != null) {
      feedRoomViewDataBuilder.isTagged(feedRoomModel.isTagged!);
    }

    if (feedRoomModel.isGuest != null) {
      feedRoomViewDataBuilder.isGuest(feedRoomModel.isGuest!);
    }

    if (feedRoomModel.isPaid != null) {
      feedRoomViewDataBuilder.isPaid(feedRoomModel.isPaid!);
    }

    if (feedRoomModel.isPinned != null) {
      feedRoomViewDataBuilder.isPinned(feedRoomModel.isPinned!);
    }

    if (feedRoomModel.isEdited != null) {
      feedRoomViewDataBuilder.isEdited(feedRoomModel.isEdited!);
    }

    if (feedRoomModel.hasBeenNamed != null) {
      feedRoomViewDataBuilder.hasBeenNamed(feedRoomModel.hasBeenNamed!);
    }

    if (feedRoomModel.autoFollowDone != null) {
      feedRoomViewDataBuilder.autoFollowDone(feedRoomModel.autoFollowDone!);
    }

    if (feedRoomModel.includeMembersLater != null) {
      feedRoomViewDataBuilder
          .includeMembersLater(feedRoomModel.includeMembersLater!);
    }

    if (feedRoomModel.accessWithoutSubscription != null) {
      feedRoomViewDataBuilder
          .accessWithoutSubscription(feedRoomModel.accessWithoutSubscription!);
    }

    if (feedRoomModel.externalSeen != null) {
      feedRoomViewDataBuilder.externalSeen(feedRoomModel.externalSeen!);
    }

    if (feedRoomModel.showFollowTelescope != null) {
      feedRoomViewDataBuilder
          .showFollowTelescope(feedRoomModel.showFollowTelescope!);
    }

    if (feedRoomModel.showFollowAutoTag != null) {
      feedRoomViewDataBuilder
          .showFollowAutoTag(feedRoomModel.showFollowAutoTag!);
    }

    if (feedRoomModel.memberCanMessage != null) {
      feedRoomViewDataBuilder.memberCanMessage(feedRoomModel.memberCanMessage!);
    }

    if (feedRoomModel.muteStatus != null) {
      feedRoomViewDataBuilder.muteStatus(feedRoomModel.muteStatus!);
    }

    if (feedRoomModel.followStatus != null) {
      feedRoomViewDataBuilder.followStatus(feedRoomModel.followStatus!);
    }

    if (feedRoomModel.communityName != null) {
      feedRoomViewDataBuilder.communityName(feedRoomModel.communityName!);
    }

    if (feedRoomModel.chatroomImageUrl != null) {
      feedRoomViewDataBuilder.chatroomImageUrl(feedRoomModel.chatroomImageUrl!);
    }

    if (feedRoomModel.onlineLinkEnableBefore != null) {
      feedRoomViewDataBuilder
          .onlineLinkEnableBefore(feedRoomModel.onlineLinkEnableBefore!);
    }

    if (feedRoomModel.onlineLinkType != null) {
      feedRoomViewDataBuilder.onlineLinkType(feedRoomModel.onlineLinkType!);
    }

    if (feedRoomModel.memberId != null) {
      feedRoomViewDataBuilder.memberId(feedRoomModel.memberId!);
    }

    if (feedRoomModel.access != null) {
      feedRoomViewDataBuilder.access(feedRoomModel.access!);
    }

    if (feedRoomModel.cohorts != null) {
      feedRoomViewDataBuilder.cohorts(feedRoomModel.cohorts!);
    }

    if (feedRoomModel.coHosts != null) {
      feedRoomViewDataBuilder.coHosts(feedRoomModel.coHosts!);
    }

    return feedRoomViewDataBuilder.build();
  }

  static FeedRoom toFeedRoom(FeedRoomViewData feedRoomViewData) {
    return FeedRoom(
      id: feedRoomViewData.id,
      title: feedRoomViewData.title,
      header: feedRoomViewData.header,
      date: feedRoomViewData.date,
      dateEpoch: feedRoomViewData.dateEpoch,
      dateTime: feedRoomViewData.dateTime,
      duration: feedRoomViewData.duration,
      cardCreationTime: feedRoomViewData.cardCreationTime,
      shareLink: feedRoomViewData.shareLink,
      thirdPartyUniqueId: feedRoomViewData.thirdPartyUniqueId,
      state: feedRoomViewData.state,
      isPrivate: feedRoomViewData.isPrivate,
      isSecret: feedRoomViewData.isSecret,
      isPending: feedRoomViewData.isPending,
      isPrivateMember: feedRoomViewData.isPrivateMember,
      isTagged: feedRoomViewData.isTagged,
      isGuest: feedRoomViewData.isGuest,
      isPaid: feedRoomViewData.isPaid,
      isPinned: feedRoomViewData.isPinned,
      isEdited: feedRoomViewData.isEdited,
      hasBeenNamed: feedRoomViewData.hasBeenNamed,
      autoFollowDone: feedRoomViewData.autoFollowDone,
      includeMembersLater: feedRoomViewData.includeMembersLater,
      accessWithoutSubscription: feedRoomViewData.accessWithoutSubscription,
      externalSeen: feedRoomViewData.externalSeen,
      showFollowTelescope: feedRoomViewData.showFollowTelescope,
      showFollowAutoTag: feedRoomViewData.showFollowAutoTag,
      memberCanMessage: feedRoomViewData.memberCanMessage,
      muteStatus: feedRoomViewData.muteStatus,
      followStatus: feedRoomViewData.followStatus,
      communityId: feedRoomViewData.communityId,
      communityName: feedRoomViewData.communityName,
      chatroomImageUrl: feedRoomViewData.chatroomImageUrl,
      onlineLinkEnableBefore: feedRoomViewData.onlineLinkEnableBefore,
      onlineLinkType: feedRoomViewData.onlineLinkType,
      participantsCount: feedRoomViewData.participantsCount,
      memberId: feedRoomViewData.memberId,
      access: feedRoomViewData.access,
      member: UserViewDataConvertor.toUser(feedRoomViewData.member),
      cohorts: feedRoomViewData.cohorts,
      coHosts: feedRoomViewData.coHosts,
    );
  }
}
