import 'package:flutter/material.dart';
import "ancestry.dart";
import "classes.dart";
import "utils.dart";

class CharacterBrief {
  const CharacterBrief({
    required this.level,
    required this.type,
    required this.name,
    required this.ancestory,
  });

  final CharacterClass type;
  final CharacterAncestry ancestory;
  final int level;
  final String name;
}

class CharacterSelectionPage extends StatefulWidget {
  @override
  State<CharacterSelectionPage> createState() => _CharacterSelectionPageState();
}

class _CharacterSelectionPageState extends State<CharacterSelectionPage> {
  var characters = <CharacterBrief>[];

  int selectedIndex = -1;

  void loadSelectedCharacter() {
    print("hi");
  }

  void setSelectedIndex(CharacterBrief char) {
    selectedIndex = characters.indexOf(char);
    print(selectedIndex);
  }

  void toCharacterCreate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Characters",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 24),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    leading: const Icon(Icons.search),
                    hintText: "Search for characters",
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {},
                    );
                  });
                },
              ),
            ),
            ...characters
                .map((m) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          CharacterCard(onPressed: setSelectedIndex, brief: m),
                    ))
                .toList(),
            Divider(),
            ElevatedButton(onPressed: toCharacterCreate, child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard(
      {super.key, required this.onPressed, required this.brief});
  final Function(CharacterBrief c) onPressed;
  final CharacterBrief brief;
  String toClassDescription(CharacterClass type, CharacterAncestry ancestory) {
    var a = ancestory.toString().split(".")[1];
    var aCapitalized = a.capitalize();
    var c = type.toString().split(".")[1];
    var cCapitalized = c.capitalize();
    return '$aCapitalized · $cCapitalized';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () => onPressed(brief),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LevelIndicator(level: brief.level),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    brief.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    toClassDescription(brief.type, brief.ancestory),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LevelIndicator extends StatelessWidget {
  const LevelIndicator({
    super.key,
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        shape: BoxShape.circle,
      ),
      child: Text(level.toString()),
    );
  }
}
