import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/classes/grid.dart';
import 'package:game_of_life/interfaces/cell_type.dart';

class GridCorner implements CellType {
  @override
  Map<int, Life> getNeighborsState(int index) {
    int size = Grid.getInstance().getSize();
    int width = Grid.getInstance().getWidth();
    List<Cell> cells = Grid.getInstance().getCells();
    Map<int, Life> neighbors = {};

    if (index == 0) {
      //Corner Top Left
      neighbors[1] = cells[1].cellState.isCellAlive();
      neighbors[width] = cells[width].cellState.isCellAlive();
      neighbors[width + 1] = cells[width + 1].cellState.isCellAlive();
    } else if (index == (size - 1)) {
      //Corner Bottom Right
      neighbors[index - 1] = cells[index - 1].cellState.isCellAlive();
      neighbors[index - width] = cells[index - width].cellState.isCellAlive();
      neighbors[index - width - 1] =
          cells[index - width - 1].cellState.isCellAlive();
    } else if (index == (width - 1)) {
      //Corner Top Right
      neighbors[index - 1] = cells[index - 1].cellState.isCellAlive();
      neighbors[index + width] = cells[index + width].cellState.isCellAlive();
      neighbors[index + width - 1] =
          cells[index + width - 1].cellState.isCellAlive();
    } else {
      //Corner Bottom Left
      neighbors[index + 1] = cells[index + 1].cellState.isCellAlive();
      neighbors[index - width] = cells[index - width].cellState.isCellAlive();
      neighbors[index - width + 1] =
          cells[index - width + 1].cellState.isCellAlive();
    }
    return neighbors;
  }
}
