import 'package:likeminds_feed_ui_fl/src/models/helper/attachment/attachment_meta_view_data.dart';

class AttachmentViewData {
  final int attachmentType;
  final AttachmentMetaViewData attachmentMeta;

  AttachmentViewData._({
    required this.attachmentType,
    required this.attachmentMeta,
  });
}

class AttachmentViewDataBuilder {
  int? _attachmentType;
  AttachmentMetaViewData? _attachmentMeta;

  void attachmentType(int attachmentType) {
    _attachmentType = attachmentType;
  }

  void attachmentMeta(AttachmentMetaViewData attachmentMeta) {
    _attachmentMeta = attachmentMeta;
  }

  AttachmentViewData build() {
    return AttachmentViewData._(
      attachmentType: _attachmentType!,
      attachmentMeta: _attachmentMeta!,
    );
  }
}
