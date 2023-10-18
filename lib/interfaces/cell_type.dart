import 'package:game_of_life/classes/enum_life.dart';

abstract class CellType {
  Map<int, Life>getNeighborsState(int index);
}