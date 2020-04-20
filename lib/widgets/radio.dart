import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  RadioButton(this.value, this.groupValue, this.onChanged, this.activeColor);
  final value;
  final groupValue;
  final onChanged;
  final activeColor;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        value,
        style: TextStyle(fontSize: 16.0, color: Colors.white70),
      ),
      Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: activeColor,
      )
    ]);
  }
}
