import 'package:flutter/material.dart';
import 'package:game_of_life/classes/grid.dart';
import 'package:game_of_life/ui/widgets/cell_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFdba8ac),
              Color(0xFFd99dab),
              Color(0xFFd593ad),
              Color(0xFFcd8ab1),
              Color(0xFFc182b8),
              Color(0xFFb677b9),
              Color(0xFFa96dbb),
              Color(0xFF9964be),
              Color(0xFF8b52bb),
              Color(0xFF7b41b8),
              Color(0xFF692fb5),
              Color(0xFF531cb3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: CellGrid(),
        ),
      ),
    );
  }
}
