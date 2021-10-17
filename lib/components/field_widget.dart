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

    if (this.field.opened && this.field.mine && this.field.exploded) {
      return Image.asset("assets/images/bomba_0.jpeg");
    } else if (this.field.opened && this.field.mine) {
      return Image.asset("assets/images/bomba_1.jpeg");
    } else if (this.field.opened && qttyMines > 0) {
      return Image.asset("assets/images/bomba_$qttyMines.jpeg");
    } else if (this.field.opened) {
      return Image.asset("assets/images/aberto_0.jpeg");
    } else if (this.field.marked) {
      return Image.asset("assets/images/bandeira.jpg");
    }
    return Image.asset("assets/images/fechado.jpeg");
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
