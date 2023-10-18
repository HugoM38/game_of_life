import 'package:flutter/material.dart';
import 'package:game_of_life/classes/grid.dart';

class CellGrid extends StatefulWidget {
  const CellGrid({super.key});

  @override
  State<CellGrid> createState() => _CellGridState();
}

class _CellGridState extends State<CellGrid> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double gridSize =
        0.75 * (screenWidth < screenHeight ? screenWidth : screenHeight);
    Grid.getInstance().initCellList();
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: gridSize,
              width: gridSize,
              child: GridView.builder(
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
                            color: Grid.getInstance()
                                .getCells()[index]
                                .cellState
                                .getColor(),
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
                itemCount: Grid.getInstance().getSize(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Grid.getInstance().nextTurn();
                });
              },
              child: const Text("Prochain tour"))
        ],
      ),
    );
  }
}
