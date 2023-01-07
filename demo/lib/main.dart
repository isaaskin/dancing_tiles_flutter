import 'package:flutter/material.dart';
import 'package:dancing_tiles/dancing_tiles.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: Container(
            color: Colors.black,
            child: TilesManager(row: 4, column: 4, tiles: [
              Tile(
                  row: 1,
                  column: 1,
                  columnSpan: 3,
                  child: Container(
                    color: Colors.amber,
                  )),
              Tile(
                  row: 2,
                  column: 3,
                  child: Container(
                    color: Colors.deepOrange,
                  )),
              Tile(row: 3, column: 3, child: Container(color: Colors.lightBlue))
            ]),
          ),
        ));
  }
}
