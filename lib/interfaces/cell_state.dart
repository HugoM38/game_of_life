import 'package:flutter/material.dart';
import 'package:game_of_life/classes/enum_life.dart';

abstract class CellState {
  Life isCellAlive();
  Color getColor();
}
