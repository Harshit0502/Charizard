import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedoke/models/pokemons.dart';
import 'package:pokedoke/screens/poke_details_screen.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokeCard({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => PokeDetailsScreen(
                  pokemon: pokemon,
                  color: pokemon.type![0] == "Grass"
                      ? Colors.greenAccent
                      : pokemon.type![0] == "Fire"
                          ? Colors.redAccent
                          : pokemon.type![0] == "Water"
                              ? Colors.blue
                              : pokemon.type![0] == "Poison"
                                  ? Colors.deepPurpleAccent
                                  : pokemon.type![0] == "Electric"
                                      ? Colors.amber
                                      : pokemon.type![0] == "Rock"
                                          ? Colors.grey
                                          : pokemon.type![0] == "Ground"
                                              ? Colors.brown
                                              : pokemon.type![0] == "Psychic"
                                                  ? Colors.indigo
                                                  : pokemon.type![0] ==
                                                          "Fighting"
                                                      ? Colors.orange
                                                      : pokemon.type![0] ==
                                                              "Bug"
                                                          ? Colors
                                                              .lightGreenAccent
                                                          : pokemon.type![0] ==
                                                                  "Ghost"
                                                              ? Colors
                                                                  .deepPurple
                                                              : pokemon.type![
                                                                          0] ==
                                                                      "Normal"
                                                                  ? Colors
                                                                      .black26
                                                                  : Colors.pink,
                )));
      },
      child: Card(
        color: pokemon.type![0] == "Grass"
            ? Colors.greenAccent
            : pokemon.type![0] == "Fire"
                ? Colors.redAccent
                : pokemon.type![0] == "Water"
                    ? Colors.blue
                    : pokemon.type![0] == "Poison"
                        ? Colors.deepPurpleAccent
                        : pokemon.type![0] == "Electric"
                            ? Colors.amber
                            : pokemon.type![0] == "Rock"
                                ? Colors.grey
                                : pokemon.type![0] == "Ground"
                                    ? Colors.brown
                                    : pokemon.type![0] == "Psychic"
                                        ? Colors.indigo
                                        : pokemon.type![0] == "Fighting"
                                            ? Colors.orange
                                            : pokemon.type![0] == "Bug"
                                                ? Colors.lightGreenAccent
                                                : pokemon.type![0] == "Ghost"
                                                    ? Colors.deepPurple
                                                    : pokemon.type![0] ==
                                                            "Normal"
                                                        ? Colors.black26
                                                        : Colors.pink,
        child: Stack(
          children: [
            Positioned(top: 30, left: 10, child: Text(pokemon.name!)),
            Positioned(top: 45, left: 10, child: Text(pokemon.type![0])),
            Positioned(
                bottom: 5,
                right: -10,
                child: CachedNetworkImage(
                  imageUrl: pokemon.img!,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ))
          ],
        ),
      ),
    );
  }
}
