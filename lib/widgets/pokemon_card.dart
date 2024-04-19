import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokedex,
    required this.index,
  });

  final List pokedex;
  final index;

  @override
  Widget build(BuildContext context) {
    final pokemonType = pokedex[index]["type"];
    final firstType = pokemonType[0];

    return Card(
      color: firstType == "Grass"
          ? Colors.green
          : firstType == "Fire"
              ? Colors.red
              : firstType == "Water"
                  ? Colors.blue
                  : firstType == "Bug"
                      ? Colors.lightGreen
                      : firstType == "Normal"
                          ? Colors.black26
                          : firstType == "Poison"
                              ? Colors.deepPurpleAccent
                              : firstType == "Electric"
                                  ? const Color.fromARGB(197, 255, 233, 32)
                                  : firstType == "Ground"
                                      ? Colors.brown
                                      : firstType == "Fighting"
                                          ? const Color.fromARGB(
                                              255, 170, 53, 2)
                                          : firstType == "Psychic"
                                              ? Colors.indigo
                                              : firstType == "Rock"
                                                  ? Colors.grey
                                                  : firstType == "Ghost"
                                                      ? Colors.deepPurple
                                                      : firstType == "Ice"
                                                          ? const Color
                                                              .fromARGB(255,
                                                              106, 194, 235)
                                                          : firstType ==
                                                                  "Dragon"
                                                              ? Colors.teal
                                                              : Colors.white,
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            child: Image.asset(
              "assets/images/pokeball.png",
              height: 100,
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: Text(
              "#${pokedex[index]['num']}",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(31, 0, 0, 0),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: CachedNetworkImage(
              imageUrl: pokedex[index]['img'],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: Text(
              pokedex[index]['name'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          !pokemonType.toString().contains(',')
              ? Positioned(
                  top: 60,
                  left: -10,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(31, 0, 0, 0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      child: Text(
                        pokemonType[0].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  top: 50,
                  right: 12,
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(31, 0, 0, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 3),
                            child: Text(
                              pokemonType[0].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(31, 0, 0, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            child: Text(
                              pokemonType[1].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
