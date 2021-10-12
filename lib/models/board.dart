import 'dart:math';

import 'package:campo_minado/models/field.dart';
import 'package:flutter/cupertino.dart';

class Board {
  final int lines;
  final int columns;
  final minesQuantity;
  final List<Field> _fields = [];

  Board({
    @required this.lines,
    @required this.columns,
    @required this.minesQuantity,
  }) {
    _createFields();
    _setNeighbors();
    _setMines();
  }

  void restart() {
    _fields.forEach((element) {
      element.restart();
    });
    _setMines();
  }

  void _revealMines() {
    _fields.forEach((element) {
      element.revealExplosive();
    });
  }

  void _createFields() {
    for (int line = 0; line < lines; line++) {
      for (int column = 0; column < columns; column++) {
        _fields.add(Field(line: line, column: column));
      }
    }
  }

  void _setNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _setMines() {
    int mines = 0;
    if (minesQuantity > lines * columns) {
      return;
    }
    while (mines < minesQuantity) {
      int i = Random().nextInt(_fields.length);
      if (!_fields[i].mine) {
        mines++;
        _fields[i].setMine();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solved {
    return _fields.every((element) => element.solved);
  }
}
