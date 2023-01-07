import 'package:flutter/material.dart';
import './tile.dart';

class TilesManager extends StatefulWidget {
  final int row;
  final int column;
  final double gutter;
  final Duration duration;
  final List<Tile> tiles;

  const TilesManager({
    super.key,
    required this.row,
    required this.column,
    required this.tiles,
    this.duration = const Duration(milliseconds: 350),
    this.gutter = 0,
  });

  @override
  TilesManagerState createState() => TilesManagerState();
}

class TilesManagerState extends State<TilesManager> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
      double getUnitHeight() {
        return ((constraints.maxHeight - (widget.gutter * (widget.row + 1))) /
            widget.row);
      }

      double getUnitWidth() {
        return ((constraints.maxWidth - (widget.gutter * (widget.column + 1))) /
            widget.column);
      }

      double getTop(Tile tile) {
        if (widget.row == 1) {
          return widget.gutter;
        } else {
          return ((tile.row * widget.gutter) +
              (tile.row - 1) * getUnitHeight());
        }
      }

      double getLeft(Tile tile) {
        if (tile.column > widget.column) {
          throw Exception([
            "Tile column cannot be bigger than container column",
            "Tile column: ${tile.row}",
            "Container column: ${widget.row}"
          ]);
        }

        if (widget.column == 1) {
          return widget.gutter as double;
        } else {
          return (tile.column * widget.gutter) +
              (tile.column - 1) * getUnitWidth();
        }
      }

      double getWidth(Tile tile) {
        return getUnitWidth() * tile.columnSpan +
            ((tile.columnSpan - 1) * widget.gutter);
      }

      double getHeight(Tile tile) {
        return getUnitHeight() * tile.rowSpan +
            ((tile.rowSpan - 1) * widget.gutter);
      }

      return Stack(
        children: widget.tiles
            .map((e) => AnimatedPositioned(
                  top: getTop(e),
                  left: getLeft(e),
                  width: getWidth(e),
                  height: getHeight(e),
                  duration: widget.duration,
                  child: e.child ?? Container(),
                ))
            .toList(),
      );
    });
  }
}
