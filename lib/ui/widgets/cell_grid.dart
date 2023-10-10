import 'package:flutter/material.dart';
import 'package:game_of_life/classes/cell_types/grid_border.dart';
import 'package:game_of_life/classes/cell_types/grid_corner.dart';
import 'package:game_of_life/classes/cell_types/grid_inside.dart';
import 'package:game_of_life/classes/grid.dart';

class CellGrid extends StatefulWidget {
  const CellGrid({super.key});

  @override
  State<CellGrid> createState() => _CellGridState();
}

class _CellGridState extends State<CellGrid> {
  @override
  Widget build(BuildContext context) {
    Grid.getInstance().initCellList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Grid.getInstance().getWidth(),
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Grid.getInstance().getCells()[index].changeCellState();
              });
            },
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Grid.getInstance().getCells()[index].cellState.getColor(),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Text(
                    Grid.getInstance().getCells()[index].cellType is GridCorner
                        ? "Corner"
                        : Grid.getInstance().getCells()[index].cellType
                                is GridBorder
                            ? "Border"
                            : "Inside"),
              ),
            ),
          ),
        );
      },
      itemCount: Grid.getInstance().getSize(),
    );
  }
}
