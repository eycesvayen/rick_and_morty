import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/model/character.dart';

class MainViewModel with ChangeNotifier {
  final String api = "https://rickandmortyapi.com/api/character";

  final List<Character> _characters = [];
  List<Character> get characters => _characters;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });
  }

  void _getCharacters() async {
    Uri uri = Uri.parse(api);
    http.Response response = await http.get(uri);

    List<dynamic> allCharacters =
        (jsonDecode(response.body) as Map<String, dynamic>)["results"];

    for (Map<String, dynamic> characterMap in allCharacters) {
      Character character = Character.fromMap(characterMap);
      _characters.add(character);
    }
    notifyListeners();
  }
}
