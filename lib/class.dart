// To parse this JSON data, do
//
//     final characterClass = characterClassFromJson(jsonString);

import 'dart:convert';

CharacterClass characterClassFromJson(String str) =>
    CharacterClass.fromJson(json.decode(str));

String characterClassToJson(CharacterClass data) => json.encode(data.toJson());

class CharacterClass {
  String id;
  String img;
  String name;
  System system;
  List<dynamic> effects;

  CharacterClass({
    required this.id,
    required this.img,
    required this.name,
    required this.system,
    required this.effects,
  });

  factory CharacterClass.fromJson(Map<String, dynamic> json) => CharacterClass(
        id: json["_id"],
        img: json["img"],
        name: json["name"],
        system: System.fromJson(json["system"]),
        effects: List<dynamic>.from(json["effects"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "name": name,
        "system": system.toJson(),
        "effects": List<dynamic>.from(effects.map((x) => x)),
      };
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

class System {
  Levels ancestryFeatLevels;
  Attacks attacks;
  Levels classFeatLevels;
  Defenses defenses;
  Description description;
  Levels generalFeatLevels;
  int hp;
  Map<String, Item> items;
  KeyAbility keyAbility;
  int perception;
  List<dynamic> rules;
  SavingThrows savingThrows;
  Levels skillFeatLevels;
  Levels skillIncreaseLevels;
  int spellcasting;
  TrainedSkills trainedSkills;
  Traits traits;
  String slug;
  Migration migration;

  System({
    required this.ancestryFeatLevels,
    required this.attacks,
    required this.classFeatLevels,
    required this.defenses,
    required this.description,
    required this.generalFeatLevels,
    required this.hp,
    required this.items,
    required this.keyAbility,
    required this.perception,
    required this.rules,
    required this.savingThrows,
    required this.skillFeatLevels,
    required this.skillIncreaseLevels,
    required this.spellcasting,
    required this.trainedSkills,
    required this.traits,
    required this.slug,
    required this.migration,
  });

  factory System.fromJson(Map<String, dynamic> json) => System(
        ancestryFeatLevels: Levels.fromJson(json["ancestryFeatLevels"]),
        attacks: Attacks.fromJson(json["attacks"]),
        classFeatLevels: Levels.fromJson(json["classFeatLevels"]),
        defenses: Defenses.fromJson(json["defenses"]),
        description: Description.fromJson(json["description"]),
        generalFeatLevels: Levels.fromJson(json["generalFeatLevels"]),
        hp: json["hp"],
        items: Map.from(json["items"])
            .map((k, v) => MapEntry<String, Item>(k, Item.fromJson(v))),
        keyAbility: KeyAbility.fromJson(json["keyAbility"]),
        perception: json["perception"],
        rules: List<dynamic>.from(json["rules"].map((x) => x)),
        savingThrows: SavingThrows.fromJson(json["savingThrows"]),
        skillFeatLevels: Levels.fromJson(json["skillFeatLevels"]),
        skillIncreaseLevels: Levels.fromJson(json["skillIncreaseLevels"]),
        spellcasting: json["spellcasting"],
        trainedSkills: TrainedSkills.fromJson(json["trainedSkills"]),
        traits: Traits.fromJson(json["traits"]),
        slug: json["slug"],
        migration: Migration.fromJson(json["_migration"]),
      );

  Map<String, dynamic> toJson() => {
        "ancestryFeatLevels": ancestryFeatLevels.toJson(),
        "attacks": attacks.toJson(),
        "classFeatLevels": classFeatLevels.toJson(),
        "defenses": defenses.toJson(),
        "description": description.toJson(),
        "generalFeatLevels": generalFeatLevels.toJson(),
        "hp": hp,
        "items": Map.from(items)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "keyAbility": keyAbility.toJson(),
        "perception": perception,
        "rules": List<dynamic>.from(rules.map((x) => x)),
        "savingThrows": savingThrows.toJson(),
        "skillFeatLevels": skillFeatLevels.toJson(),
        "skillIncreaseLevels": skillIncreaseLevels.toJson(),
        "spellcasting": spellcasting,
        "trainedSkills": trainedSkills.toJson(),
        "traits": traits.toJson(),
        "slug": slug,
        "_migration": migration.toJson(),
      };
}

class Levels {
  List<int> value;

  Levels({
    required this.value,
  });

  factory Levels.fromJson(Map<String, dynamic> json) => Levels(
        value: List<int>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "value": List<dynamic>.from(value.map((x) => x)),
      };
}

class Attacks {
  int advanced;
  int martial;
  Other other;
  int simple;
  int unarmed;

  Attacks({
    required this.advanced,
    required this.martial,
    required this.other,
    required this.simple,
    required this.unarmed,
  });

  factory Attacks.fromJson(Map<String, dynamic> json) => Attacks(
        advanced: json["advanced"],
        martial: json["martial"],
        other: Other.fromJson(json["other"]),
        simple: json["simple"],
        unarmed: json["unarmed"],
      );

  Map<String, dynamic> toJson() => {
        "advanced": advanced,
        "martial": martial,
        "other": other.toJson(),
        "simple": simple,
        "unarmed": unarmed,
      };
}

class Other {
  String name;
  int rank;

  Other({
    required this.name,
    required this.rank,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        name: json["name"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rank": rank,
      };
}

class Defenses {
  int heavy;
  int light;
  int medium;
  int unarmored;

  Defenses({
    required this.heavy,
    required this.light,
    required this.medium,
    required this.unarmored,
  });

  factory Defenses.fromJson(Map<String, dynamic> json) => Defenses(
        heavy: json["heavy"],
        light: json["light"],
        medium: json["medium"],
        unarmored: json["unarmored"],
      );

  Map<String, dynamic> toJson() => {
        "heavy": heavy,
        "light": light,
        "medium": medium,
        "unarmored": unarmored,
      };
}

class Description {
  String value;

  Description({
    required this.value,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Item {
  String img;
  int level;
  String name;
  String uuid;

  Item({
    required this.img,
    required this.level,
    required this.name,
    required this.uuid,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        img: json["img"],
        level: json["level"],
        name: json["name"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "level": level,
        "name": name,
        "uuid": uuid,
      };
}

class KeyAbility {
  List<String> value;

  KeyAbility({
    required this.value,
  });

  factory KeyAbility.fromJson(Map<String, dynamic> json) => KeyAbility(
        value: List<String>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "value": List<dynamic>.from(value.map((x) => x)),
      };
}

class Migration {
  double version;
  dynamic previous;

  Migration({
    required this.version,
    required this.previous,
  });

  factory Migration.fromJson(Map<String, dynamic> json) => Migration(
        version: json["version"]?.toDouble(),
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "previous": previous,
      };
}

class SavingThrows {
  int fortitude;
  int reflex;
  int will;

  SavingThrows({
    required this.fortitude,
    required this.reflex,
    required this.will,
  });

  factory SavingThrows.fromJson(Map<String, dynamic> json) => SavingThrows(
        fortitude: json["fortitude"],
        reflex: json["reflex"],
        will: json["will"],
      );

  Map<String, dynamic> toJson() => {
        "fortitude": fortitude,
        "reflex": reflex,
        "will": will,
      };
}

class TrainedSkills {
  int additional;
  List<dynamic> value;

  TrainedSkills({
    required this.additional,
    required this.value,
  });

  factory TrainedSkills.fromJson(Map<String, dynamic> json) => TrainedSkills(
        additional: json["additional"],
        value: List<dynamic>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "additional": additional,
        "value": List<dynamic>.from(value.map((x) => x)),
      };
}

class Traits {
  String rarity;
  List<dynamic> value;

  Traits({
    required this.rarity,
    required this.value,
  });

  factory Traits.fromJson(Map<String, dynamic> json) => Traits(
        rarity: json["rarity"],
        value: List<dynamic>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "value": List<dynamic>.from(value.map((x) => x)),
      };
}
