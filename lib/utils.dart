import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String stripHtml() => replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
}

List<DropdownMenuEntry<String>> toMenuItems(List<String> items) {
  var formatted = items.map((e) => e.split(".")[1].capitalize()).toList();
  List<DropdownMenuEntry<String>> menuEntries =
      UnmodifiableListView<DropdownMenuEntry<String>>(
    formatted.map<DropdownMenuEntry<String>>(
        (String name) => DropdownMenuEntry<String>(value: name, label: name)),
  );
  return menuEntries;
}

DropdownMenuEntry<String> toMenuItem(String item) {
  return DropdownMenuEntry<String>(value: item, label: item);
}

Future<List<dynamic>> readJsonFile(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}
