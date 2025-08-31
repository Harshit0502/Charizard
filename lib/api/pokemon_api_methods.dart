import 'dart:convert';
import 'package:pokedoke/api/pokemon_api_constants.dart';
import 'package:pokedoke/models/pokemons.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Pokemons> getPokemons() async {
    var client = http.Client();
    var uri = Uri.parse(pokeApi);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return Pokemons.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}