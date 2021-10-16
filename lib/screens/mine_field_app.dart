import 'package:campo_minado/components/result_widget.dart';
import 'package:flutter/material.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({Key? key}) : super(key: key);

  void _restart() {
    print("Restart...");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          won: null,
          onRestart: _restart,
        ),
        body: Container(
          child: Text('Board'),
        ),
      ),
    );
  }
}
