import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/screen/home_screen.dart';

class PokemonSplash extends StatefulWidget {
  const PokemonSplash({super.key});

  @override
  State<PokemonSplash> createState() => _PokemonSplashState();
}

class _PokemonSplashState extends State<PokemonSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 100,
              child: Image.asset("assets/images/pokeball.png"),
            ),
            Positioned(
              top: 230,
              left: -30,
              child: Image.asset(
                "assets/images/pokeball.png",
                height: 200,
              ),
            ),
            Positioned(
              top: 100,
              left: 140,
              child: RichText(
                text: const TextSpan(
                    text: "Poke",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
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
            Positioned(
              top: 300,
              left: 115,
              child: Image.asset(
                "assets/images/loading.gif",
                height: 200,
              ),
            ),
            const Positioned(
              top: 500,
              left: 150,
              child: Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Positioned(
              bottom: 50,
              left: 150,
              child: Text(
                "@msxcodes - 2024",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
