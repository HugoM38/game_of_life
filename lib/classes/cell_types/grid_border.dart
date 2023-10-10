import 'package:game_of_life/classes/enum_life.dart';
import 'package:game_of_life/interfaces/cell_type.dart';

class GridBorder implements CellType {

  @override
  Map<int, Life> getNeighborsState() {
    // TODO: implement getNeighborsState
    return <int, Life>{};
  }

}