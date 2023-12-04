import 'package:likeminds_feed_ui_fl/src/models/commons/popup_menu_view_data.dart';
import 'package:likeminds_feed_ui_fl/src/models/helper/attachment/attachment_view_data.dart';

class PostViewData {
  final String id;
  String text;
  List<String> topics;
  List<AttachmentViewData>? attachments;
  final int communityId;
  bool isPinned;
  final String userId;
  int likeCount;
  int commentCount;
  bool isSaved;
  bool isLiked;
  List<PopUpMenuItemViewData> menuItems;
  final DateTime createdAt;
  DateTime updatedAt;
  bool isEdited;

  PostViewData._({
    required this.id,
    required this.text,
    required this.attachments,
    required this.communityId,
    required this.isPinned,
    required this.userId,
    required this.likeCount,
    required this.isSaved,
    required this.topics,
    required this.menuItems,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.commentCount,
    required this.isEdited,
  });
}

class PostViewDataBuilder {
  String? _id;
  String? _text;
  List<String>? _topics;
  List<AttachmentViewData>? _attachments;
  int? _communityId;
  bool? _isPinned;
  String? _userId;
  int? _likeCount;
  int? _commentCount;
  bool? _isSaved;
  bool? _isLiked;
  List<PopUpMenuItemViewData>? _menuItems;
  DateTime? _createdAt;
  DateTime? _updatedAt;
  bool? _isEdited;

  void id(String id) {
    _id = id;
  }

  void text(String text) {
    _text = text;
  }

  void topics(List<String> topics) {
    _topics = topics;
  }

  void attachments(List<AttachmentViewData> attachments) {
    _attachments = attachments;
  }

  void communityId(int communityId) {
    _communityId = communityId;
  }

  void isPinned(bool isPinned) {
    _isPinned = isPinned;
  }

  void userId(String userId) {
    _userId = userId;
  }

  void likeCount(int likeCount) {
    _likeCount = likeCount;
  }

  void commentCount(int commentCount) {
    _commentCount = commentCount;
  }

  void isSaved(bool isSaved) {
    _isSaved = isSaved;
  }

  void isLiked(bool isLiked) {
    _isLiked = isLiked;
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

  void isEdited(bool isEdited) {
    _isEdited = isEdited;
  }

  PostViewData build() {
    return PostViewData._(
      id: _id!,
      text: _text!,
      topics: _topics!,
      attachments: _attachments,
      communityId: _communityId!,
      isPinned: _isPinned!,
      userId: _userId!,
      likeCount: _likeCount!,
      commentCount: _commentCount!,
      isSaved: _isSaved!,
      isLiked: _isLiked!,
      menuItems: _menuItems!,
      createdAt: _createdAt!,
      updatedAt: _updatedAt!,
      isEdited: _isEdited!,
    );
  }
}
