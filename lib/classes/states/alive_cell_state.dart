import 'package:flutter/material.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/interfaces/cell_state.dart';

class AliveCellState implements CellState {
  @override
  Life isCellAlive() {
    return Life.alive;
  }

  @override
  Color getColor() {
    return Colors.amber;
  }
}
