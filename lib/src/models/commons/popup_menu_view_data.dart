class PopUpMenuItemViewData {
  final String title;
  final int id;

  PopUpMenuItemViewData._({
    required this.title,
    required this.id,
  });
}

class PopUpMenuItemViewDataBuilder {
  String? _title;
  int? _id;

  void title(String title) {
    _title = title;
  }

  void id(int id) {
    _id = id;
  }

  PopUpMenuItemViewData build() {
    return PopUpMenuItemViewData._(
      title: _title!,
      id: _id!,
    );
  }
}
