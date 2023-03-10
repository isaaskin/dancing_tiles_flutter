import 'package:flutter/material.dart';
import './tile.dart';

class TilesManager extends StatelessWidget {
  final int row;
  final int column;
  final double gutter;
  final Duration duration;
  final Curve curve;
  final List<Tile> tiles;

  const TilesManager({
    super.key,
    required this.row,
    required this.column,
    required this.tiles,
    this.duration = const Duration(milliseconds: 350),
    this.curve = Curves.ease,
    this.gutter = 0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
      double getUnitHeight() {
        return ((constraints.maxHeight - (gutter * (row + 1))) / row);
      }

      double getUnitWidth() {
        return ((constraints.maxWidth - (gutter * (column + 1))) / column);
      }

      double getTop(Tile tile) {
        if (row == 1) {
          return gutter;
        } else {
          return ((tile.row * gutter) + (tile.row - 1) * getUnitHeight());
        }
      }

      double getLeft(Tile tile) {
        if (column == 1) {
          return gutter;
        } else {
          return (tile.column * gutter) + (tile.column - 1) * getUnitWidth();
        }
      }

      double getWidth(Tile tile) {
        return getUnitWidth() * tile.columnSpan +
            ((tile.columnSpan - 1) * gutter);
      }

      double getHeight(Tile tile) {
        return getUnitHeight() * tile.rowSpan + ((tile.rowSpan - 1) * gutter);
      }

      return Stack(
        children: tiles
            .map((e) => AnimatedPositioned(
                  top: getTop(e),
                  left: getLeft(e),
                  width: getWidth(e),
                  height: getHeight(e),
                  duration: duration,
                  curve: curve,
                  child: e.child ?? Container(),
                ))
            .toList(),
      );
    });
  }
}
