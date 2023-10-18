import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/cell_types/grid_border.dart';
import 'package:game_of_life/classes/cell_types/grid_corner.dart';
import 'package:game_of_life/classes/cell_types/grid_inside.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/interfaces/cell_state.dart';

class Grid {
  static final Grid _instance = Grid._();

  Grid._();

  int _width = 14;
  int _size = 98;
  int _currentTurn = 0;
  final List<Cell> _cellList = [];

  static Grid getInstance() {
    return _instance;
  }

  getWidth() {
    return _width;
  }

  getSize() {
    return _size;
  }

  List<Cell> getCells() {
    return _cellList;
  }

  setWidth(int width) {
    _width = width;
  }

  setSize(int size) {
    _size = size;
  }

  nextTurn() {
    for (var cell in _cellList) {
      Life cellState = cell.cellState.isCellAlive();
      Map<int, Life> neighborsState = cell.neighborsStateCommand.execute();
      int aliveNeighbors = 0;

      neighborsState.forEach((key, value) {
        if (value == Life.alive) {
          aliveNeighbors++;
        }
      });

      if (cellState == Life.alive &&
          (aliveNeighbors < 2 || aliveNeighbors > 3)) {
        cell.changeCellState();
      } else if (cellState == Life.dead && aliveNeighbors == 3) {
        cell.changeCellState();
      }
    }
    _currentTurn++;
  }

  initCellList() {
    for (var i = 0; i < Grid.getInstance().getSize(); i++) {
      int size = Grid.getInstance().getSize();
      int width = Grid.getInstance().getWidth();
      if (i == 0 ||
          i == (size - 1) ||
          i == (width - 1) ||
          i == (size - width)) {
        _cellList.add(Cell(GridCorner(), i));
      } else if (i < (width - 1) ||
          i > (size - width) ||
          (i % width) == 0 ||
          (i % width) == (width - 1)) {
        _cellList.add(Cell(GridBorder(), i));
      } else {
        _cellList.add(Cell(GridInside(), i));
      }
    }
  }
}
