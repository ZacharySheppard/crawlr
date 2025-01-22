import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'class.dart';
import "utils.dart";
import "characters.dart";

class CharacterCreationPage extends StatefulWidget {
  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  var level = 1;
  var type = "";
  var ancestory = "";
  var name = "";

  var description = "";
  var selected = -1;
  void nextPage() {}

  void prevPage() {}

  void saveCharacter(CharacterBrief brief) {}

  @override
  Widget build(BuildContext context) {
    // convert char classes to menu items

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Characters Name',
            ),
          ),
          SizedBox(height: 10),
          FutureBuilder(
              future: readJsonFile("classes.json"),
              initialData: <Map<String, dynamic>>[],
              builder: (context, snapshot) {
                var values = CharacterClass.fromList(snapshot.data ?? []);

                return Column(
                  children: [
                    DropdownMenu<String>(
                      width: double.maxFinite,
                      trailingIcon: Icon(Icons.arrow_drop_down_sharp),
                      label: Text("Class"),
                      onSelected: (String? value) {
                        setState(() {
                          selected = values
                              .map((e) => e.name)
                              .toList()
                              .indexOf(value!);
                        });
                      },
                      dropdownMenuEntries:
                          values.map((i) => toMenuItem(i.name)).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    (values.isEmpty || selected < 0)
                        ? Text("Select a Character")
                        : CharacterBrief(characterClass: values[selected]),
                  ],
                );
              }),
          Expanded(
            child: SizedBox(height: null),
          ),
          ElevatedButton(
            onPressed: prevPage,
            child: Text("Create"),
          ),
        ],
      ),
    );
  }
}

class CharacterBrief extends StatelessWidget {
  final CharacterClass characterClass;
  const CharacterBrief({
    super.key,
    required this.characterClass,
  });

  @override
  Widget build(BuildContext context) {
    var description = characterClass.system.description.value.stripHtml();
    var end = description.indexOf("@");

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Class Description"),
        ),
        Card(
          child: Text(description.substring(0, end)),
        ),
        Text("Defense"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatusIndicator(
              type: "Unarmoured",
              isTrained: characterClass.system.defenses.unarmored > 0,
            ),
            StatusIndicator(
              type: "Light",
              isTrained: characterClass.system.defenses.light > 0,
            ),
            StatusIndicator(
              type: "Medium",
              isTrained: characterClass.system.defenses.medium > 0,
            ),
            StatusIndicator(
              type: "Heavy",
              isTrained: characterClass.system.defenses.heavy > 0,
            )
          ],
        ),
        Divider(),
        Text("Attack"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatusIndicator(
              type: "Unarmed",
              isTrained: characterClass.system.attacks.unarmed > 0,
            ),
            StatusIndicator(
              type: "Simple",
              isTrained: characterClass.system.attacks.simple > 0,
            ),
            StatusIndicator(
              type: "Martial",
              isTrained: characterClass.system.attacks.martial > 0,
            ),
            StatusIndicator(
              type: "Advanced",
              isTrained: characterClass.system.attacks.advanced > 0,
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({
    super.key,
    required this.type,
    required this.isTrained,
  });

  final String type;
  final bool isTrained;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: isTrained
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surfaceContainer,
        ),
        color: isTrained
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceContainer,
        shape: BoxShape.circle,
      ),
      child: Text(type[0]),
    );
  }
}
