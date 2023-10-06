import 'package:flutter/material.dart';
import 'package:game_of_life/ui/home.dart';

void main() {
  runApp(const GameOfLife());
}

class GameOfLife extends StatelessWidget {
  const GameOfLife({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GameOfLife',
      home: Home(title: 'Le jeux de la vie'),
      debugShowCheckedModeBanner: false,
    );
  }
}
