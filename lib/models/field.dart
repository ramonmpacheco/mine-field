import 'package:campo_minado/exceptions/explosion_exception.dart';
import 'package:flutter/cupertino.dart';

class Field {
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _mine = false;
  bool _exploded = false;

  Field({
    @required this.line,
    @required this.column,
  });

  void addNeighbor(Field neighbor) {
    final lineDelta = (line - neighbor.line).abs();
    final columnDelta = (column - neighbor.column).abs();

    if (_isMyself(lineDelta, columnDelta)) {
      return;
    }

    if (_isMyNeighbor(lineDelta, columnDelta)) {
      neighbors.add(neighbor);
    }
  }

  bool _isMyself(final int lineDelta, final int columnDelta) {
    return lineDelta == 0 && columnDelta == 0;
  }

  bool _isMyNeighbor(final int lineDelta, final int columnDelta) {
    return lineDelta <= 1 && columnDelta <= 1;
  }

  void open() {
    if (_opened) {
      return;
    }
    _opened = true;
    if (_mine) {
      _exploded = true;
      throw ExplosionException();
    }
    if (safeNeighborhood) {
      neighbors.forEach((n) {
        n.open();
      });
    }
  }

  void revealExplosive() {
    if (_mine) {
      _opened = true;
    }
  }

  void setMine() {
    _mine = true;
  }

  void switchMarkup() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _mine = false;
    _exploded = false;
  }

  bool get mine {
    return _mine;
  }

  bool get exploded {
    return _exploded;
  }

  bool get opened {
    return _opened;
  }

  bool get marked {
    return _marked;
  }

  bool get solved {
    return (_mine && _marked) || (!_mine && opened);
  }

  bool get safeNeighborhood {
    return neighbors.every((n) => !n._mine);
  }

  int get quantityOfMinesInNeighborhood {
    return neighbors.where((n) => n.mine).length;
  }
}
