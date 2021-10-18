import 'package:campo_minado/components/board_widget.dart';
import 'package:campo_minado/components/result_widget.dart';
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
  Board _board = Board(lines: 12, columns: 12, minesQuantity: 3);

  void _restart() {
    print("Restart...");
  }

  void _open(Field field) {
    print('abrir');
  }

  void _switchMarkup(Field field) {
    print("switchMarkup");
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
          child: BoardWidget(
            board: _board,
            onOpen: _open,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      ),
    );
  }
}
