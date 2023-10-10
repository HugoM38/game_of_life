import 'package:game_of_life/classes/cell.dart';
import 'package:game_of_life/interfaces/cell_type.dart';
import 'package:game_of_life/interfaces/command.dart';

class NeighborsStateCommand implements Command {

  final CellType _cellType;
  final int _index;
  final int _width;
  final List<Cell> _cells;

  NeighborsStateCommand(this._cellType, this._index, this._width, this._cells);

  @override
  void execute() {
   _cellType.getNeighborsState(_index, _width, _cells);
  }

}