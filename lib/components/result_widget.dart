import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? won;
  final void Function() onRestart;

  const ResultWidget({Key? key, required this.won, required this.onRestart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onRestart,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);

  _getColor() {
    if (this.won == null) {
      return Colors.yellow;
    } else if (this.won != null) {
      return Colors.green[300];
    }
    return Colors.red[300];
  }

  IconData _getIcon() {
    if (won == null) {
      return Icons.sentiment_satisfied;
    } else if (this.won != null) {
      return Icons.sentiment_very_satisfied;
    }
    return Icons.sentiment_very_dissatisfied;
  }
}
