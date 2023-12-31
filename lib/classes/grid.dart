import 'dart:math';

import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/classes/cell_types/grid_border.dart';
import 'package:game_of_life/classes/cell_types/grid_corner.dart';
import 'package:game_of_life/classes/cell_types/grid_inside.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/classes/states/dead_cell_state.dart';

class Grid {
  static final Grid _instance = Grid._();

  Grid._();

  int _width = 17;
  int _size = 289;
  int _currentTurn = 0;
  bool _gameStarted = false;
  bool _autoModeStarted = false;
  final List<Cell> _cellList = [];
  final List<Cell> _oldCellList = [];

  static Grid getInstance() {
    return _instance;
  }

  getWidth() {
    return _width;
  }

  getCurrentTurn() {
    return _currentTurn;
  }

  getSize() {
    return _size;
  }

  isGameStarted() {
    return _gameStarted;
  }

  isGameAutoStarted() {
    return _autoModeStarted;
  }

  startAutoMode() {
    _autoModeStarted = true;
  }

  stopAutoMode() {
    _autoModeStarted = false;
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
    if (!_gameStarted) {
      _gameStarted = true;
    }
    var changedState = false;
    _oldCellList.clear();

    for (var cell in _cellList) {
      Cell newCell = Cell(cell.cellType, cell.index);
      newCell.cellState = cell.cellState;
      _oldCellList.add(newCell);
    }

    for (var cell in _cellList) {
      int currentIndex = _cellList.indexOf(cell);
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

      if (_oldCellList[currentIndex].cellState.isCellAlive() !=
          cell.cellState.isCellAlive()) {
        changedState = true;
      }
    }
    if (changedState) {
      _currentTurn++;
    } else {
      _autoModeStarted = false;
      _gameStarted = false;
    }
  }

  randomizeGrid() {
    reset();
    for (var cell in _cellList) {
      Random().nextInt(5) == 0 ? cell.changeCellState() : null;
    }
  }

  reset() {
    _gameStarted = false;
    _currentTurn = 0;
    for (var cell in _cellList) {
      cell.cellState = DeadCellState();
    }
  }

  initCellList() {
    _cellList.clear();
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
