import 'package:flutter/material.dart';
import 'package:game_of_life/interfaces/cell_state.dart';

class AliveCellState implements CellState {
  @override
  bool isCellAlive() {
    return true;
  }

  @override
  Color getColor() {
    return Colors.amber;
  }
}
