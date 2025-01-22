class CharacterAncestry {
  const CharacterAncestry({
    required this.id,
    required this.ancestry,
  });
  factory CharacterAncestry.fromJson(Map<String, dynamic> data) {
    // ! there's a problem with this code (see below)
    final id = data['id'] as int;
    final ancestry = data['name'] as String;
    return CharacterAncestry(id: id, ancestry: ancestry);
  }
  final int id;
  final String ancestry;
}
