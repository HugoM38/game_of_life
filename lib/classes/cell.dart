import 'package:game_of_life/classes/states/alive_cell_state.dart';
import 'package:game_of_life/classes/states/dead_cell_state.dart';
import 'package:game_of_life/interfaces/cell_state.dart';

class Cell {
  CellState cellState = DeadCellState();

  void changeCellState() {
    if(cellState.isCellAlive()) {
      cellState = DeadCellState();
    } else {
      cellState = AliveCellState();
    }
  }
}
