import 'package:dancing_tiles/tile.dart';
import 'package:dancing_tiles/tiles_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TilesManager(row: 4, column: 4, tiles: [
        Tile(row: 1, column: 1, child: Container(color: Colors.blue)),
        Tile(
            row: 2,
            column: 1,
            rowSpan: 2,
            columnSpan: 3,
            child: Container(color: Colors.yellow)),
        Tile(
            row: 4,
            column: 2,
            columnSpan: 2,
            child: Container(color: Colors.green))
      ]),
    );
  }
}
