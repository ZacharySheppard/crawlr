import 'package:flutter/material.dart';
import "characters.dart";
import "creation.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crawlr',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 93, 107, 55)),
      ),
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = CharacterCreationPage();
      case 1:
        page = Text("Sheet");
      case 2:
        page = CharacterSelectionPage();
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRAWLR",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'Cinzel',
            fontSize: 30,
          ),
        ),
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Sheet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Characters',
          ),
        ],
      ),
    );
  }
}
