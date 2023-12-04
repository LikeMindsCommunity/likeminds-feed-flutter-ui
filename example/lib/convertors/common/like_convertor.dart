import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/models/commons/like_view_data.dart';

class LikeViewDataConvertor {
  static LikeViewData fromLike({required Like likeModel}) {
    LikeViewDataBuilder likeViewDataBuilder = LikeViewDataBuilder();
    likeViewDataBuilder
      ..id(likeModel.id)
      ..userId(likeModel.userId)
      ..createdAt(likeModel.createdAt)
      ..updatedAt(likeModel.updatedAt);
    return likeViewDataBuilder.build();
  }

  static Like toLike(LikeViewData likeViewData) {
    return Like(
      id: likeViewData.id,
      createdAt: likeViewData.createdAt,
      updatedAt: likeViewData.updatedAt,
      userId: likeViewData.userId,
    );
  }
}
