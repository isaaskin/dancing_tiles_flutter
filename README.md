[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![Flutter Web](https://github.com/isaaskin/dancing_tiles_flutter/actions/workflows/dart.yml/badge.svg)](https://github.com/isaaskin/dancing_tiles_flutter/actions/workflows/dart.yml)
[![Flutter Test Package](https://github.com/isaaskin/dancing_tiles_flutter/actions/workflows/flutter_test.yml/badge.svg)](https://github.com/isaaskin/dancing_tiles_flutter/actions/workflows/flutter_test.yml)

# Dancing Tiles

A simple and lightweight Flutter package to create a grid view with animatable tiles.

## Demo

Link to Demo App
https://isaaskin.github.io/dancing_tiles_flutter

![](https://raw.githubusercontent.com/isaaskin/dancing_tiles_flutter/main/demo/assets/dancing_tiles_flutter_demo_gif.gif)

## Installation

Add the following line to pubspec.yaml:

```
dependencies:
  dancing_tiles: ^0.0.1
```

## Usage/Examples

```dart
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
```

## Authors

- [@isaaskin](https://www.github.com/isaaskin)

## License

[MIT](https://choosealicense.com/licenses/mit/)
