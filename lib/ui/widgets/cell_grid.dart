import 'package:flutter/material.dart';
import 'package:game_of_life/classes/cell.dart';

class CellGrid extends StatefulWidget {
  const CellGrid({super.key});

  @override
  State<CellGrid> createState() => _CellGridState();
}

class _CellGridState extends State<CellGrid> {
  List<Cell> cellList = [];

  @override
  Widget build(BuildContext context) {
    initCellList();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                cellList[index].changeCellState();
              });
            },
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  color: cellList[index].cellState.getColor(),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: 9,
    );
  }

  initCellList() {
    for (var i = 0; i < 9; i++) {
      cellList.add(Cell());
    }
  }
}
