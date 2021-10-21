import 'package:campo_minado/components/board_widget.dart';
import 'package:campo_minado/components/result_widget.dart';
import 'package:campo_minado/exceptions/explosion_exception.dart';
import 'package:campo_minado/models/board.dart';
import 'package:campo_minado/models/field.dart';
import 'package:flutter/material.dart';

class MineFieldApp extends StatefulWidget {
  const MineFieldApp({Key? key}) : super(key: key);

  @override
  _MineFieldAppState createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  bool? _won;
  Board? _board;

  void _restart() {
    setState(() {
      _won = null;
      _board!.restart();
    });
  }

  void _open(Field field) {
    if (_won != null) {
      return;
    }

    setState(() {
      try {
        field.open();

        if (_board!.solved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board!.revealMines();
      }
    });
  }

  void _switchMarkup(Field field) {
    setState(() {
      field.switchMarkup();
      if (_board!.solved) {
        _won = true;
      }
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int columns = 15;
      double fieldSize = width / columns;
      int lines = (height / fieldSize).floor();
      _board = Board(lines: lines, columns: columns, minesQuantity: 3);
    }
    return _board!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: _won,
          onRestart: _restart,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return BoardWidget(
                board: _getBoard(constraints.maxWidth, constraints.maxHeight),
                onOpen: _open,
                onSwitchMarkup: _switchMarkup,
              );
            },
          ),
        ),
      ),
    );
  }
}
