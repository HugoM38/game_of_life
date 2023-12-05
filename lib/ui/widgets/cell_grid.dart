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
            padding: const EdgeInsets.all(15.0),
            child: Text(
              Grid.getInstance().getCurrentTurn().toString(),
              style: const TextStyle(
                  color: Color.fromRGBO(244, 211, 94, 100),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
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
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          !Grid.getInstance().isGameStarted()
                              ? Grid.getInstance()
                                  .getCells()[index]
                                  .changeCellState()
                              : null;
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
                              color: const Color.fromRGBO(244, 211, 94, 100),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Grid.getInstance().randomizeGrid();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(244, 211, 94, 100))),
                  child: const Text(
                    "Aléatoire",
                    style: TextStyle(color: Color.fromRGBO(6, 39, 38, 100)),
                  )),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Grid.getInstance().nextTurn();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(244, 211, 94, 100))),
                  child: const Text(
                    "Prochain tour",
                    style: TextStyle(color: Color.fromRGBO(6, 39, 38, 100)),
                  )),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Grid.getInstance().startAutoMode(context);
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(244, 211, 94, 100))),
                  child: const Text(
                    "Mode automatique",
                    style: TextStyle(color: Color.fromRGBO(6, 39, 38, 100)),
                  )),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Grid.getInstance().reset();
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(244, 211, 94, 100))),
                  child: const Text(
                    "Réinitialiser",
                    style: TextStyle(color: Color.fromRGBO(6, 39, 38, 100)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
