import 'package:flutter/material.dart';
import 'package:game_of_life/classes/grid.dart';

class CellGrid extends StatefulWidget {
  const CellGrid({super.key});

  @override
  State<CellGrid> createState() => _CellGridState();
}

class _CellGridState extends State<CellGrid> {
  double sliderVal = 1.0;
  int autoSpeed = 1000;
  String typeOfSpeed = "milliseconds";

  @override
  void initState() {
    super.initState();
    Grid.getInstance().initCellList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double gridSize =
        0.75 * (screenWidth < screenHeight ? screenWidth : screenHeight);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              Grid.getInstance().getCurrentTurn().toString(),
              style: const TextStyle(
                  color: Color.fromRGBO(244, 211, 94, 1),
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
                              color: const Color.fromRGBO(244, 211, 94, 1),
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
              Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Grid.getInstance().randomizeGrid();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(244, 211, 94, 1))),
                          child: const Text(
                            "Aléatoire",
                            style:
                                TextStyle(color: Color.fromRGBO(6, 39, 38, 1)),
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
                                  const Color.fromRGBO(244, 211, 94, 1))),
                          child: const Text(
                            "Prochain tour",
                            style:
                                TextStyle(color: Color.fromRGBO(6, 39, 38, 1)),
                          )),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () async {
                            if (Grid.getInstance().isGameAutoStarted()) {
                              Grid.getInstance().stopAutoMode();
                            } else {
                              Grid.getInstance().startAutoMode();
                              while (Grid.getInstance().isGameAutoStarted()) {
                                switch (typeOfSpeed) {
                                  case "milliseconds":
                                    await Future.delayed(
                                        Duration(milliseconds: autoSpeed));
                                    break;
                                  case "microseconds":
                                    await Future.delayed(
                                        Duration(microseconds: autoSpeed));
                                    break;
                                  default:
                                    await Future.delayed(
                                        Duration(milliseconds: autoSpeed));
                                    break;
                                }

                                setState(() {
                                  Grid.getInstance().nextTurn();
                                });
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(244, 211, 94, 1))),
                          child: const Text(
                            "Mode automatique",
                            style:
                                TextStyle(color: Color.fromRGBO(6, 39, 38, 1)),
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
                                  const Color.fromRGBO(244, 211, 94, 1))),
                          child: const Text(
                            "Réinitialiser",
                            style:
                                TextStyle(color: Color.fromRGBO(6, 39, 38, 1)),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Vitesse du mode auto",
                        style: TextStyle(
                            color: Color.fromRGBO(244, 211, 94, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        value: sliderVal,
                        min: 1.0,
                        max: 6.0,
                        divisions: 5,
                        onChanged: (value) {
                          setState(() {
                            sliderVal = value;
                            switch (value) {
                              case 1.0:
                                autoSpeed = 1000;
                                break;
                              case 2.0:
                                autoSpeed = 500;
                                break;
                              case 3.0:
                                autoSpeed = 200;
                                break;
                              case 4.0:
                                autoSpeed = 100;
                                break;
                              case 5.0:
                                autoSpeed = 10;
                                break;
                              case 6.0:
                                autoSpeed = 1;
                              default:
                                autoSpeed = 1000;
                                break;
                            }
                          });
                        },
                      ),
                      Text(
                        typeOfSpeed == "milliseconds"
                            ? "${autoSpeed.toString()} ms"
                            : "${autoSpeed.toString()} μs",
                        style: const TextStyle(
                            color: Color.fromRGBO(244, 211, 94, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: DropdownButton<String>(
                          value: typeOfSpeed,
                          onChanged: (value) {
                            setState(() {
                              typeOfSpeed = value!;
                            });
                          },
                          dropdownColor: const Color.fromRGBO(6, 39, 38, 1),
                          items: const <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                              value: "milliseconds",
                              child: Text(
                                "milliseconds",
                                style: TextStyle(
                                    color: Color.fromRGBO(244, 211, 94, 1)),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "microseconds",
                              child: Text("microseconds",
                                  style: TextStyle(
                                      color: Color.fromRGBO(244, 211, 94, 1))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
