import 'package:game_of_life/classes/commands/neighbors_state_command.dart';
import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/classes/states/alive_cell_state.dart';
import 'package:game_of_life/classes/states/dead_cell_state.dart';
import 'package:game_of_life/interfaces/cell_state.dart';
import 'package:game_of_life/interfaces/cell_type.dart';
import 'package:game_of_life/interfaces/command.dart';

class Cell {
  CellState cellState = DeadCellState();
  CellType cellType;
  int index;
  late Command neighborsStateCommand;


  Cell(this.cellType, this.index) {
    neighborsStateCommand = NeighborsStateCommand(cellType, index);
  }


  void changeCellState() {
    if(cellState.isCellAlive() == Life.alive) {
      cellState = DeadCellState();
    } else {
      cellState = AliveCellState();
    }
  }
}
