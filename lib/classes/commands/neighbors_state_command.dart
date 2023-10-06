import 'package:game_of_life/interfaces/cell_type.dart';
import 'package:game_of_life/interfaces/command.dart';

class NeighborsStateCommand implements Command {

  final CellType _cellType;

  NeighborsStateCommand(this._cellType);

  @override
  void execute() {
   _cellType.getNeighborsState();
  }

}