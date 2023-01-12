import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dancing_tiles/dancing_tiles.dart';

void main() {
  testWidgets('init tile manager with one tile', ((widgetTester) async {
    const containerKey = Key('ck');

    var tilesManager = MaterialApp(
      home: Scaffold(
          body: TilesManager(row: 4, column: 4, tiles: [
        Tile(
            row: 1,
            column: 1,
            child: Container(
              key: containerKey,
              color: Colors.green,
            ))
      ])),
    );

    await widgetTester.pumpWidget(tilesManager);

    var containerFinder = find.byKey(containerKey);
    var container = widgetTester.firstWidget(containerFinder) as Container;

    expect(container.color, Colors.green);
  }));

  testWidgets('init tile manager with multiple tiles', ((widgetTester) async {
    const containerKey1 = Key('ck1');
    const containerKey2 = Key('ck2');

    var tilesManager = MaterialApp(
      home: Scaffold(
          body: TilesManager(row: 4, column: 4, tiles: [
        Tile(
            row: 1,
            column: 1,
            child: Container(
              key: containerKey1,
              color: Colors.green,
            )),
        Tile(
            row: 2,
            column: 2,
            child: Container(
              key: containerKey2,
              color: Colors.blue,
            ))
      ])),
    );

    await widgetTester.pumpWidget(tilesManager);

    expect(find.byKey(containerKey1), findsOneWidget);
    expect(find.byKey(containerKey2), findsOneWidget);
  }));

  testWidgets('tile is created with correct size', ((widgetTester) async {
    const containerKey = Key('ck');
    const tmKey = Key('tm');

    var tilesManager = MaterialApp(
      home: Scaffold(
          body: TilesManager(key: tmKey, row: 4, column: 4, tiles: [
        Tile(
            row: 1,
            column: 1,
            child: Container(
              key: containerKey,
              color: Colors.green,
            ))
      ])),
    );

    await widgetTester.pumpWidget(tilesManager);

    expect((widgetTester.getSize(find.byKey(containerKey))).width,
        widgetTester.getSize(find.byKey(tmKey)).width / 4);
  }));

  testWidgets('tile with span is created with correct size',
      ((widgetTester) async {
    const containerKey = Key('ck');
    const tmKey = Key('tm');

    var tilesManager = MaterialApp(
      home: Scaffold(
          body: TilesManager(key: tmKey, row: 4, column: 4, tiles: [
        Tile(
            row: 1,
            column: 1,
            rowSpan: 3,
            columnSpan: 3,
            child: Container(
              key: containerKey,
              color: Colors.green,
            ))
      ])),
    );

    await widgetTester.pumpWidget(tilesManager);

    expect((widgetTester.getSize(find.byKey(containerKey))).width,
        widgetTester.getSize(find.byKey(tmKey)).width * 0.75);
  }));
}
