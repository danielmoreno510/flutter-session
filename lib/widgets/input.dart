import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(this.label, this.onChanged, {this.obscureText: false});
  final onChanged;
  final label;
  final obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white70),
        errorStyle: TextStyle(color: Colors.white70),
        hintText: '$label',
        contentPadding: EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.white)),
      
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white70),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.white)),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: obscureText,
    );
  }
}
