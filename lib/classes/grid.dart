import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/cell_types/grid_border.dart';
import 'package:game_of_life/classes/cell_types/grid_corner.dart';
import 'package:game_of_life/classes/cell_types/grid_inside.dart';

class Grid {
  static final Grid _instance = Grid._();

  Grid._();

  int _width = 14;
  int _size = 98;
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

  initCellList() {
    for (var i = 0; i < Grid.getInstance().getSize(); i++) {
      int size = Grid.getInstance().getSize();
      int width = Grid.getInstance().getWidth();
      if (i == 0 ||
          i == (size - 1) ||
          i == (width - 1) ||
          i == (size - width)) {
        _cellList.add(Cell(GridCorner()));
      } else if (i < (width - 1) ||
          i > (size - width) ||
          (i % width) == 0 ||
          (i % width) == (width - 1)) {
        _cellList.add(Cell(GridBorder()));
      } else {
        _cellList.add(Cell(GridInside()));
      }
    }
  }
}
