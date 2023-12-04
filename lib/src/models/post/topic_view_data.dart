class TopicViewData {
  String name;
  final String id;
  bool isEnabled;

  TopicViewData._(
      {required this.name, required this.id, required this.isEnabled});
}

class TopicViewDataBuilder {
  String? _name;
  String? _id;
  bool? _isEnabled;

  void name(String name) {
    _name = name;
  }

  void id(String id) {
    _id = id;
  }

  void isEnabled(bool isEnabled) {
    _isEnabled = isEnabled;
  }

  TopicViewData build() {
    if (_name == null || _id == null || _isEnabled == null) {
      throw Exception(
          "TopicViewDataBuilder: name, id and isEnabled must be set");
    }
    return TopicViewData._(name: _name!, id: _id!, isEnabled: _isEnabled!);
  }
}
