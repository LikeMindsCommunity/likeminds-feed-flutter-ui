class LikeViewData {
  String id;
  int createdAt;
  int updatedAt;
  String userId;

  LikeViewData._({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });
}

class LikeViewDataBuilder {
  String? _id;
  int? _createdAt;
  int? _updatedAt;
  String? _userId;

  void id(String id) {
    _id = id;
  }

  void createdAt(int createdAt) {
    _createdAt = createdAt;
  }

  void updatedAt(int updatedAt) {
    _updatedAt = updatedAt;
  }

  void userId(String userId) {
    _userId = userId;
  }

  LikeViewData build() {
    return LikeViewData._(
      id: _id!,
      createdAt: _createdAt!,
      updatedAt: _updatedAt!,
      userId: _userId!,
    );
  }
}
