part of 'new_post_bloc.dart';

abstract class NewPostEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateNewPost extends NewPostEvents {
  final List<MediaModel>? postMedia;
  final String postText;
  final int feedRoomId;

  CreateNewPost({
    this.postMedia,
    required this.postText,
    required this.feedRoomId,
  });
}

class EditPost extends NewPostEvents {
  final List<Attachment>? attachments;
  final String postText;
  final int? feedRoomId;
  final String postId;

  EditPost({
    required this.postText,
    this.attachments,
    this.feedRoomId,
    required this.postId,
  });
}
