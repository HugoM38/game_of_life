import 'package:flutter/material.dart';
import 'package:game_of_life/interfaces/cell_state.dart';

class DeadCellState implements CellState {
  @override
  bool isCellAlive() {
    return false;
  }

  @override
  Color getColor() {
    return Colors.white;
  }
}
