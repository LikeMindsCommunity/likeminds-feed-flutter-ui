import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/src/models/comment/comment_view_data.dart';
import 'package:lm_feed_ui_example/convertors/common/popup_menu_convertor.dart';

class CommentViewDataConvertor {
  static CommentViewData fromCommentReply(CommentReply comment) {
    CommentViewDataBuilder commentViewDataBuilder = CommentViewDataBuilder();
    commentViewDataBuilder
      ..id(comment.id)
      ..userId(comment.userId)
      ..text(comment.text)
      ..level(comment.level)
      ..likesCount(comment.likesCount)
      ..repliesCount(comment.repliesCount)
      ..menuItems(comment.menuItems
          .map((e) => PopupMenuItemConvertor.fromPopUpMenuItemModel(item: e))
          .toList())
      ..createdAt(comment.createdAt)
      ..updatedAt(comment.updatedAt)
      ..isLiked(comment.isLiked)
      ..isEdited(comment.isEdited)
      ..parentComment(comment.parentComment != null
          ? CommentViewDataConvertor.fromCommentReply(comment.parentComment!)
          : null);
    return commentViewDataBuilder.build();
  }

  static CommentViewData fromReply(Reply comment) {
    CommentViewDataBuilder commentViewDataBuilder = CommentViewDataBuilder();
    commentViewDataBuilder
      ..id(comment.id)
      ..userId(comment.userId)
      ..text(comment.text)
      ..level(comment.level)
      ..likesCount(comment.likesCount)
      ..repliesCount(comment.repliesCount)
      ..menuItems(comment.menuItems
          .map((e) => PopupMenuItemConvertor.fromPopUpMenuItemModel(item: e))
          .toList())
      ..createdAt(comment.createdAt)
      ..updatedAt(comment.updatedAt)
      ..isLiked(comment.isLiked)
      ..isEdited(comment.isEdited)
      ..parentComment(comment.parentComment != null
          ? CommentViewDataConvertor.fromReply(comment.parentComment!)
          : null);
    return commentViewDataBuilder.build();
  }

  static Reply toReply(CommentViewData commentViewData) {
    return Reply(
      userId: commentViewData.userId,
      text: commentViewData.text,
      level: commentViewData.level,
      likesCount: commentViewData.likesCount,
      repliesCount: commentViewData.repliesCount,
      menuItems: commentViewData.menuItems
          .map((e) => PopupMenuItemConvertor.toPopUpMenuItemModel(e))
          .toList(),
      createdAt: commentViewData.createdAt,
      updatedAt: commentViewData.updatedAt,
      isLiked: commentViewData.isLiked,
      id: commentViewData.id,
      parentComment: commentViewData.parentComment != null
          ? CommentViewDataConvertor.toReply(commentViewData.parentComment!)
          : null,
      isEdited: commentViewData.isEdited,
    );
  }

  static CommentReply toCommentReply(CommentViewData commentViewData) {
    return CommentReply(
      userId: commentViewData.userId,
      text: commentViewData.text,
      level: commentViewData.level,
      likesCount: commentViewData.likesCount,
      repliesCount: commentViewData.repliesCount,
      menuItems: commentViewData.menuItems
          .map((e) => PopupMenuItemConvertor.toPopUpMenuItemModel(e))
          .toList(),
      createdAt: commentViewData.createdAt,
      updatedAt: commentViewData.updatedAt,
      isLiked: commentViewData.isLiked,
      id: commentViewData.id,
      parentComment: commentViewData.parentComment != null
          ? CommentViewDataConvertor.toCommentReply(
              commentViewData.parentComment!)
          : null,
      isEdited: commentViewData.isEdited,
    );
  }
}
