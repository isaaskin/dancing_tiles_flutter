import 'package:flutter/material.dart';

class Tile {
  final int row;
  final int column;
  final int rowSpan;
  final int columnSpan;
  final Widget? child;

  const Tile(
      {required this.row,
      required this.column,
      this.rowSpan = 1,
      this.columnSpan = 1,
      this.child});
}
