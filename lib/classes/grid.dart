import 'package:game_of_life/classes/cell.dart';

class Grid {
  static final Grid _instance = Grid._();

  Grid._();

  int _width = 10;
  int _size = 100;
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

  getCells() {
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
      _cellList.add(Cell());
    }
  }
}
