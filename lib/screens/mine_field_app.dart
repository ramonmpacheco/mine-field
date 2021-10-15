import 'package:flutter/material.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mine Field'),
        ),
        body: Container(
          child: Text('Board'),
        ),
      ),
    );
  }
}
