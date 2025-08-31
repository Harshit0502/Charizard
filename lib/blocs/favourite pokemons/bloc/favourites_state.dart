// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourites_bloc.dart';

class FavouritesState {
  final List<Pokemon> favouritePokemons;
  final List<String> uId;
  FavouritesState(
      {this.favouritePokemons = const <Pokemon>[],
      this.uId = const <String>[]});

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'favouritePokemons': favouritePokemons.map((x) => x.toJson()).toList(),
  //   };
  // }

  // factory FavouritesState.fromMap(Map<String, dynamic> map) {
  //   return FavouritesState(
  //     favouritePokemons: List<Pokemon>.from(map['favouritePokemons']?.map((x) => Pokemon.fromJson(x))),
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favouritePokemons': favouritePokemons.map((x) => x.toJson()).toList(),
      'uId': uId,
    };
  }

  factory FavouritesState.fromMap(Map<String, dynamic> map) {
    return FavouritesState(
        favouritePokemons: List<Pokemon>.from(
            map['favouritePokemons']?.map((x) => Pokemon.fromJson(x))),
        uId: List<String>.from(map['uId'] as List<String>));
  }
}
