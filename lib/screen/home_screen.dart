import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/screen/details_pokemon.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pokedex = [];

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  void fetchPokemon() async {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    var response = await http.get(url);
    // await Future.delayed(Duration(seconds: 1));
    if (response.statusCode == 200) {
      var decodedPokemon = convert.jsonDecode(response.body);
      pokedex = decodedPokemon['pokemon'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(pokedex: pokedex),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
    required this.pokedex,
  });

  final List pokedex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Image.asset(
                      "assets/images/pokeball.png",
                      height: 200,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  const Positioned(
                    top: 65,
                    left: 15,
                    child: Icon(Icons.menu),
                  ),
                  const Positioned(
                    top: 70,
                    right: 15,
                    child: Icon(CupertinoIcons.settings_solid),
                  ),
                  Positioned(
                    top: 110,
                    left: 15,
                    child: RichText(
                      text: const TextSpan(
                          text: "Poke",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "X",
                              style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            pokedex.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) {
                        final firstType = pokedex[index]['type'][0];
                        return InkWell(
                          child: PokemonCard(pokedex: pokedex, index: index),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetails(
                                  pokemonDetails: pokedex[index],
                                  heroTag: index,
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
                                                          ? Colors
                                                              .deepPurpleAccent
                                                          : firstType ==
                                                                  "Electric"
                                                              ? const Color
                                                                  .fromARGB(197,
                                                                  255, 233, 32)
                                                              : firstType ==
                                                                      "Ground"
                                                                  ? Colors.brown
                                                                  : firstType ==
                                                                          "Fighting"
                                                                      ? const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          170,
                                                                          53,
                                                                          2)
                                                                      : firstType ==
                                                                              "Psychic"
                                                                          ? Colors
                                                                              .indigo
                                                                          : firstType == "Rock"
                                                                              ? Colors.grey
                                                                              : firstType == "Ghost"
                                                                                  ? Colors.deepPurple
                                                                                  : firstType == "Ice"
                                                                                      ? const Color.fromARGB(255, 106, 194, 235)
                                                                                      : firstType == "Dragon"
                                                                                          ? Colors.teal
                                                                                          : Colors.white,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      itemCount: pokedex.length,
                    ),
                  )
                : const Center(
                    child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 300),
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )),
          ],
        ),
      ],
    );
  }
}
