import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/interfaces/cell_type.dart';
import 'package:game_of_life/interfaces/command.dart';

class NeighborsStateCommand implements Command {

  final CellType _cellType;
  final int _index;

  NeighborsStateCommand(this._cellType, this._index);

  @override
  Map<int, Life> execute() {
   return _cellType.getNeighborsState(_index);
  }

}