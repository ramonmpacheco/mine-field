import 'package:campo_minado/components/field_widget.dart';
import 'package:campo_minado/components/result_widget.dart';
import 'package:campo_minado/exceptions/explosion_exception.dart';
import 'package:campo_minado/models/field.dart';
import 'package:flutter/material.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({Key? key}) : super(key: key);

  void _restart() {
    print("Restart...");
  }

  void _abrir(Field field) {
    print('abrir');
  }

  void _switchMarkup(Field field) {
    print("switchMarkup");
  }

  @override
  Widget build(BuildContext context) {
    Field f = Field(line: 0, column: 0);
    try {
      f.setMine();
      f.open();
    } on ExplosionException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: _restart,
        ),
        body: Container(
          child: FieldWidget(
            field: f,
            onOpen: _abrir,
            onSwitchMarkup: _switchMarkup,
          ),
        ),
      ),
    );
  }
}
