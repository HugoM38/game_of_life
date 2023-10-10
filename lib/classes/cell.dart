import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/classes/states/alive_cell_state.dart';
import 'package:game_of_life/classes/states/dead_cell_state.dart';
import 'package:game_of_life/interfaces/cell_state.dart';
import 'package:game_of_life/interfaces/cell_type.dart';

class Cell {
  CellState cellState = DeadCellState();
  CellType cellType;

  Cell(this.cellType);


  void changeCellState() {
    if(cellState.isCellAlive() == Life.alive) {
      cellState = DeadCellState();
    } else {
      cellState = AliveCellState();
    }
  }
}
