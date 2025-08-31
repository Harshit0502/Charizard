import 'package:pokedoke/models/pokemons.dart';

List<Pokemon> getFilteredFavourites(List<Pokemon> allPokemons, List<String> allUsers,String userId){
  List<Pokemon> filtered = [];
  for (int i = 0; i < allPokemons.length; i++) {
    if (allUsers[i] == userId) {
      filtered.add(allPokemons[i]);
    }
  }
  return filtered;
}