import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({
    super.key,
    required this.pokemonDetails,
    required this.color,
    required this.heroTag,
  });

  final pokemonDetails;
  final Color color;
  final int heroTag;

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  bool favFlag = false;
  Color favColor = Colors.white;
  Icon favIcon = const Icon(
    Icons.favorite_border_outlined,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
            top: 220,
            right: -30,
            height: 200,
            child: Image.asset("assets/images/pokeball.png"),
          ),
          Positioned(
            bottom: 0,
            left: -9,
            child: Container(
              width: 430,
              height: 480,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Text(
              widget.pokemonDetails['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: IconButton(
              onPressed: () {
                if (favFlag) {
                  setState(() {
                    favColor = Colors.white;
                    favIcon = const Icon(
                      Icons.favorite_border_outlined,
                    );
                  });
                  favFlag = false;
                } else {
                  setState(() {
                    favColor = Colors.red;
                    favIcon = const Icon(
                      Icons.favorite,
                    );
                  });
                  favFlag = true;
                }
              },
              icon: favIcon,
              color: favColor,
            ),
          ),
          Positioned(
              top: 160,
              right: 30,
              child: Text(
                "#${widget.pokemonDetails['num']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
          Positioned(
            top: 180,
            left: 20,
            child: widget.pokemonDetails['type'].toString().contains(",")
                ? Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(29, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 7,
                          ),
                          child: Text(
                            widget.pokemonDetails['type'][0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(29, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 7,
                          ),
                          child: Text(
                            widget.pokemonDetails['type'][1],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(29, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 7,
                      ),
                      child: Text(
                        widget.pokemonDetails['type'][0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
          ),
          Positioned(
            top: 190,
            left: 75,
            child: SizedBox(
              width: 280,
              height: 280,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetails['img'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 480,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Name                    ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Height                   ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['height'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Weight                   ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['weight'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Spawn Chance     ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['spawn_chance'].toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Spawn Time         ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['spawn_time'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Candy                    ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['candy'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Weakness             ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.pokemonDetails['weaknesses'].toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Pre-Evolution       ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.pokemonDetails['prev_evolution'] != null
                        ? Text(
                            widget.pokemonDetails['prev_evolution'][0]['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            "No Pre-Evolution",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Next-Evolution     ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.pokemonDetails['next_evolution'] != null
                        ? Text(
                            widget.pokemonDetails['next_evolution'][0]['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            "Final Form",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
