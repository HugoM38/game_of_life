import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/classes/grid.dart';
import 'package:game_of_life/interfaces/cell_type.dart';

class GridBorder implements CellType {
  @override
  Map<int, Life> getNeighborsState(int index) {
    int size = Grid.getInstance().getSize();
    int width = Grid.getInstance().getWidth();
    List<Cell> cells = Grid.getInstance().getCells();
    Map<int, Life> neighbors = {};

    if (index < (width - 1)) {
      //Border Top
      neighbors[index - 1] = cells[index - 1].cellState.isCellAlive();
      neighbors[index + 1] = cells[index + 1].cellState.isCellAlive();
      neighbors[index + width] = cells[index + width].cellState.isCellAlive();
      neighbors[index + width - 1] =
          cells[index + width - 1].cellState.isCellAlive();
      neighbors[index + width + 1] =
          cells[index + width + 1].cellState.isCellAlive();
    } else if (index > (size - width)) {
      //Border Bottom
      neighbors[index - 1] = cells[index - 1].cellState.isCellAlive();
      neighbors[index + 1] = cells[index + 1].cellState.isCellAlive();
      neighbors[index - width] = cells[index - width].cellState.isCellAlive();
      neighbors[index - width - 1] =
          cells[index - width - 1].cellState.isCellAlive();
      neighbors[index - width + 1] =
          cells[index - width + 1].cellState.isCellAlive();
    } else if ((index % width) == 0) {
      //Border Left
      neighbors[index + 1] = cells[index + 1].cellState.isCellAlive();
      neighbors[index + width] = cells[index + width].cellState.isCellAlive();
      neighbors[index - width] = cells[index - width].cellState.isCellAlive();
      neighbors[index + width + 1] =
          cells[index + width + 1].cellState.isCellAlive();
      neighbors[index - width + 1] =
          cells[index - width + 1].cellState.isCellAlive();
    } else {
      //Border Right
      neighbors[index - 1] = cells[index - 1].cellState.isCellAlive();
      neighbors[index + width] = cells[index + width].cellState.isCellAlive();
      neighbors[index - width] = cells[index - width].cellState.isCellAlive();
      neighbors[index + width - 1] =
          cells[index + width - 1].cellState.isCellAlive();
      neighbors[index - width - 1] =
          cells[index - width - 1].cellState.isCellAlive();
    }
    return neighbors;
  }
}
