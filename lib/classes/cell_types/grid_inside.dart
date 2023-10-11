import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/interfaces/cell_type.dart';

class GridInside implements CellType {
  @override
  Map<int, Life> getNeighborsState(int index, int width, List<Cell> cells) {
    Map<int, Life> neighbors = {};
    neighbors[index + 1] = cells[index + 1].cellState.isCellAlive();
    neighbors[index - 1] = cells[index - 1].cellState.isCellAlive();
    neighbors[index - width] = cells[index - width].cellState.isCellAlive();
    neighbors[index - width - 1] =
        cells[index - width - 1].cellState.isCellAlive();
    neighbors[index - width + 1] =
        cells[index - width + 1].cellState.isCellAlive();
    neighbors[index + width] = cells[index + width].cellState.isCellAlive();
    neighbors[index + width - 1] =
        cells[index + width - 1].cellState.isCellAlive();
    neighbors[index + width + 1] =
        cells[index + width + 1].cellState.isCellAlive();
    return neighbors;
  }
}
