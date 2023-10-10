import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/enum_life.dart';

abstract class CellType {
  Map<int, Life>getNeighborsState(int index, int width, List<Cell> cells);
}