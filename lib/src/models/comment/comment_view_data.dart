import 'package:likeminds_feed_ui_fl/src/models/commons/popup_menu_view_data.dart';

class CommentViewData {
  String id;
  String userId;
  String text;
  int level;
  int likesCount;
  bool? isEdited;
  int repliesCount;
  CommentViewData? parentComment;
  List<PopUpMenuItemViewData> menuItems;
  DateTime createdAt;
  DateTime updatedAt;
  bool isLiked;

  CommentViewData._({
    required this.id,
    required this.userId,
    required this.text,
    required this.level,
    required this.likesCount,
    required this.repliesCount,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    this.isEdited,
    this.parentComment,
  });
}

class CommentViewDataBuilder {
  String? _id;
  String? _userId;
  String? _text;
  int? _level;
  int? _likesCount;
  bool? _isEdited;
  int? _repliesCount;
  CommentViewData? _parentComment;
  List<PopUpMenuItemViewData>? _menuItems;
  DateTime? _createdAt;
  DateTime? _updatedAt;
  bool? _isLiked;

  void id(String id) {
    _id = id;
  }

  void userId(String userId) {
    _userId = userId;
  }

  void text(String text) {
    _text = text;
  }

  void level(int level) {
    _level = level;
  }

  void likesCount(int likesCount) {
    _likesCount = likesCount;
  }

  void isEdited(bool? isEdited) {
    _isEdited = isEdited;
  }

  void repliesCount(int repliesCount) {
    _repliesCount = repliesCount;
  }

  void parentComment(CommentViewData? parentComment) {
    _parentComment = parentComment;
  }

  void menuItems(List<PopUpMenuItemViewData> menuItems) {
    _menuItems = menuItems;
  }

  void createdAt(DateTime createdAt) {
    _createdAt = createdAt;
  }

  void updatedAt(DateTime updatedAt) {
    _updatedAt = updatedAt;
  }

  void isLiked(bool isLiked) {
    _isLiked = isLiked;
  }

  CommentViewData build() {
    return CommentViewData._(
      id: _id!,
      userId: _userId!,
      text: _text!,
      level: _level!,
      likesCount: _likesCount!,
      isEdited: _isEdited,
      repliesCount: _repliesCount!,
      parentComment: _parentComment,
      menuItems: _menuItems!,
      createdAt: _createdAt!,
      updatedAt: _updatedAt!,
      isLiked: _isLiked!,
    );
  }
}
