import 'package:dancing_tiles/tile.dart';
import 'package:dancing_tiles/tiles_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Demo());
}

enum TilesState { A, B, C, D, E }

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => DemoState();
}

class DemoState extends State<Demo> {
  var tilesState = TilesState.A;

  Tile createTile(int row, int column, String name, Color color,
      {int rowSpan = 1, int columnSpan = 1}) {
    return Tile(
        row: row,
        column: column,
        rowSpan: rowSpan,
        columnSpan: columnSpan,
        child: Container(
            color: color,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(child: Text(name)),
              Center(child: Text("Row: $row Column: $column RowSpan: $rowSpan ColumnSpan: $columnSpan"))
            ])));
  }

  List<Tile> tiles = [];
  double gutter = 0;
  int duration = 350;

  @override
  void initState() {
    super.initState();

    setState(() {
      tiles.add(createTile(1, 1, "Tile 1", Colors.blue));
      tiles.add(createTile(2, 3, "Tile 2", Colors.orange));
      tiles.add(createTile(3, 4, "Tile 3", Colors.green));
      tiles.add(createTile(4, 6, "Tile 4", Colors.teal));
      tiles.add(createTile(6, 5, "Tile 5", Colors.lime));
    });
  }

  void updateTilesPositions() {
    switch (tilesState) {
      case TilesState.A:
        setState(() {
          tiles[0].row = 1;
          tiles[0].column = 1;
          tiles[0].rowSpan = 1;
          tiles[0].columnSpan = 1;

          tiles[1].row = 2;
          tiles[1].column = 3;
          tiles[1].rowSpan = 1;
          tiles[1].columnSpan = 1;

          tiles[2].row = 3;
          tiles[2].column = 4;
          tiles[2].rowSpan = 1;
          tiles[2].columnSpan = 1;

          tiles[3].row = 4;
          tiles[3].column = 6;
          tiles[3].rowSpan = 1;
          tiles[3].columnSpan = 1;

          tiles[4].row = 6;
          tiles[4].column = 5;
          tiles[4].rowSpan = 1;
          tiles[4].columnSpan = 1;
        });
        break;
      case TilesState.B:
        setState(() {
          tiles[0].row = 1;
          tiles[0].column = 1;
          tiles[0].rowSpan = 2;
          tiles[0].columnSpan = 2;

          tiles[1].row = 1;
          tiles[1].column = 3;
          tiles[1].rowSpan = 4;
          tiles[1].columnSpan = 2;

          tiles[2].row = 4;
          tiles[2].column = 5;
          tiles[2].rowSpan = 3;
          tiles[2].columnSpan = 1;

          tiles[3].row = 6;
          tiles[3].column = 1;
          tiles[3].rowSpan = 1;
          tiles[3].columnSpan = 3;

          tiles[4].row = 6;
          tiles[4].column = 6;
          tiles[4].rowSpan = 1;
          tiles[4].columnSpan = 1;
        });
        break;
      case TilesState.C:
        setState(() {
          tiles[0].row = 1;
          tiles[0].column = 1;
          tiles[0].rowSpan = 4;
          tiles[0].columnSpan = 2;

          tiles[1].row = 3;
          tiles[1].column = 3;
          tiles[1].rowSpan = 2;
          tiles[1].columnSpan = 2;

          tiles[2].row = 4;
          tiles[2].column = 5;
          tiles[2].rowSpan = 4;
          tiles[2].columnSpan = 1;

          tiles[3].row = 5;
          tiles[3].column = 1;
          tiles[3].rowSpan = 2;
          tiles[3].columnSpan = 3;

          tiles[4].row = 6;
          tiles[4].column = 6;
          tiles[4].rowSpan = 1;
          tiles[4].columnSpan = 1;
        });
        break;
      case TilesState.D:
        setState(() {
          tiles[0].row = 1;
          tiles[0].column = 1;
          tiles[0].rowSpan = 3;
          tiles[0].columnSpan = 1;

          tiles[1].row = 2;
          tiles[1].column = 3;
          tiles[1].rowSpan = 4;
          tiles[1].columnSpan = 1;

          tiles[2].row = 3;
          tiles[2].column = 4;
          tiles[2].rowSpan = 2;
          tiles[2].columnSpan = 1;

          tiles[3].row = 2;
          tiles[3].column = 6;
          tiles[3].rowSpan = 3;
          tiles[3].columnSpan = 1;

          tiles[4].row = 1;
          tiles[4].column = 5;
          tiles[4].rowSpan = 3;
          tiles[4].columnSpan = 1;
        });
        break;
      case TilesState.E:
        setState(() {
          tiles[0].row = 1;
          tiles[0].column = 1;
          tiles[0].rowSpan = 6;
          tiles[0].columnSpan = 1;

          tiles[1].row = 1;
          tiles[1].column = 2;
          tiles[1].rowSpan = 3;
          tiles[1].columnSpan = 5;

          tiles[2].row = 5;
          tiles[2].column = 6;
          tiles[2].rowSpan = 2;
          tiles[2].columnSpan = 1;

          tiles[3].row = 4;
          tiles[3].column = 2;
          tiles[3].rowSpan = 1;
          tiles[3].columnSpan = 5;

          tiles[4].row = 5;
          tiles[4].column = 2;
          tiles[4].rowSpan = 2;
          tiles[4].columnSpan = 4;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dancing Tiles Demo",
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Container(
            color: Colors.grey[200],
            child: TilesManager(row: 1, column: 12, tiles: [
              Tile(
                  row: 1,
                  column: 1,
                  columnSpan: 10,
                  child: Container(
                      color: Colors.grey[900],
                      child: TilesManager(
                        row: 6,
                        column: 6,
                        gutter: gutter,
                        tiles: tiles,
                        duration: Duration(milliseconds: duration),
                      ))),
              Tile(
                  row: 1,
                  column: 11,
                  columnSpan: 2,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      const Text(
                        "Tile states",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                      for (var state in TilesState.values)
                        ListTile(
                          title: Text("State ${state.name}"),
                          leading: Radio<TilesState>(
                            value: state,
                            groupValue: tilesState,
                            onChanged: (TilesState? value) {
                              setState(() {
                                tilesState = value!;
                              });
                              updateTilesPositions();
                            },
                          ),
                        ),
                      const Divider(
                        height: 40,
                        thickness: 10,
                      ),
                      const Text(
                        "Gutter",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                      Text(gutter.toStringAsFixed(2)),
                      Slider(
                        min: 0.0,
                        max: 30.0,
                        value: gutter,
                        onChanged: (value) {
                          setState(() {
                            gutter = value;
                          });
                        },
                      ),
                      const Divider(
                        height: 40,
                        thickness: 10,
                      ),
                      const Text(
                        "Duration (ms)",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                      Text(duration.toInt().toString()),
                      Slider(
                        min: 0,
                        max: 1000,
                        value: duration.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            duration = value.toInt();
                          });
                        },
                      )
                    ],
                  )))
            ])),
      ),
    );
  }
}
