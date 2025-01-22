class SavingThrows {
  final int fortitude;
  final int reflex;
  final int will;

  const SavingThrows({
    required this.fortitude,
    required this.reflex,
    required this.will,
  });

  factory SavingThrows.fromJson(Map<String, dynamic> data) {
    final int fortitude = data["fortitude"];
    final int reflex = data["reflex"];
    final int will = data["will"];

    return SavingThrows(fortitude: fortitude, reflex: reflex, will: will);
  }
}

class Defenses {
  final int heavy;
  final int light;
  final int medium;
  final int unarmored;

  const Defenses({
    required this.heavy,
    required this.light,
    required this.medium,
    required this.unarmored,
  });

  factory Defenses.fromJson(Map<String, dynamic> data) {
    final int heavy = data["heavy"] as int;
    final int light = data["light"] as int;
    final int medium = data["medium"] as int;
    final int unarmored = data["unarmored"] as int;
    return Defenses(
        heavy: heavy, light: light, medium: medium, unarmored: unarmored);
  }
}

class OtherAttack {
  final int rank;
  final String name;

  const OtherAttack({
    required this.rank,
    required this.name,
  });

  factory OtherAttack.fromJson(Map<String, dynamic> data) {
    final String name = data["name"] as String;
    final int rank = data["rank"] as int;
    return OtherAttack(rank: rank, name: name);
  }
}

class Attacks {
  final int advanced;
  final int martial;
  final int simple;
  final int unarmed;
  final OtherAttack other;

  const Attacks({
    required this.advanced,
    required this.martial,
    required this.simple,
    required this.unarmed,
    required this.other,
  });

  factory Attacks.fromJson(Map<String, dynamic> data) {
    final int advanced = data["advanced"] as int;
    final int martial = data["martial"] as int;
    final int simple = data["simple"] as int;
    final int unarmed = data["unarmed"] as int;
    final OtherAttack other = OtherAttack.fromJson(data["other"]);
    return Attacks(
      advanced: advanced,
      martial: martial,
      simple: simple,
      unarmed: unarmed,
      other: other,
    );
  }
}

class CharacterClass {
  const CharacterClass({
    required this.id,
    required this.name,
    required this.attacks,
    required this.defenses,
  });
  final String id;
  final String name;
  final Attacks attacks;
  final Defenses defenses;

  factory CharacterClass.fromJson(Map<String, dynamic> data) {
    // ! there's a problem with this code (see below)
    final id = data['_id'] as String;
    final name = data['name'] as String;
    var system = data['system'] as Map<String, dynamic>;
    final attacks = Attacks.fromJson(system["attacks"]);
    final defenses = Defenses.fromJson(system["defenses"]);
    return CharacterClass(
        id: id, name: name, attacks: attacks, defenses: defenses);
  }

  static List<CharacterClass> fromList(List<dynamic> jsonList) {
    final list = <CharacterClass>[];
    for (final elementJson in jsonList) {
      try {
        final obj =
            CharacterClass.fromJson(elementJson as Map<String, dynamic>);
        list.add(obj);
      } catch (e) {
        print('error $e parsing $elementJson');
      }
    }
    return list;
  }
}
