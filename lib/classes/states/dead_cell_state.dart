import 'package:flutter/material.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/interfaces/cell_state.dart';

class DeadCellState implements CellState {
  @override
  Life isCellAlive() {
    return Life.dead;
  }

  @override
  Color getColor() {
    return const Color.fromRGBO(6, 39, 38, 100);
  }
}
