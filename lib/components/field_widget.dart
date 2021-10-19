import 'package:campo_minado/models/field.dart';
import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final Function(Field) onOpen;
  final Function(Field) onSwitchMarkup;

  const FieldWidget(
      {Key? key,
      required this.field,
      required this.onOpen,
      required this.onSwitchMarkup})
      : super(key: key);

  Widget _getImage() {
    int qttyMines = this.field.quantityOfMinesInNeighborhood;

    if (field.opened && field.mine && field.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.opened && field.mine) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.opened) {
      return Image.asset('assets/images/aberto_$qttyMines.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(this.field),
      onLongPress: () => onSwitchMarkup(this.field),
      child: this._getImage(),
    );
  }
}
