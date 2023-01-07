import 'package:flutter/material.dart';

class Tile {
  int row;
  int column;
  int rowSpan;
  int columnSpan;
  Widget? child;

  Tile(
      {required this.row,
      required this.column,
      this.rowSpan = 1,
      this.columnSpan = 1,
      this.child});
}
