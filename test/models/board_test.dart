import 'dart:math';

import 'package:campo_minado/models/board.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Win Game", () {
    Board board = Board(lines: 2, columns: 3, minesQuantity: 0);
    board.fields[0].setMine();
    board.fields[3].setMine();

    board.fields[0].switchMarkup();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].switchMarkup();

    expect(board.solved, isTrue);
  });
}
