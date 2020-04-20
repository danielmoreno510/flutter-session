import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.text, this.color, this.splashColor, this.onPressed);
  final text;
  final color;
  final splashColor;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(40, 12, 40, 12),
      splashColor: splashColor,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(24.0),
          side: BorderSide(color: color)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
