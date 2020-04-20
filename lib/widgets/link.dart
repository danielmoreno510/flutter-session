import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  Link(this.text, this.onTap);
  final String text;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          decoration: TextDecoration.underline,
          color: Colors.white)),
      onTap: (){
        onTap();
        }
      );
  }
}
