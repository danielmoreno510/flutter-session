import 'package:flutter/material.dart';

import 'package:example/widgets/input.dart';
import 'package:example/widgets/button.dart';
import 'package:example/utils/percentage.dart';
import 'package:example/widgets/link.dart';
import 'package:example/services/auth.dart';
import 'package:example/models/signin.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  User user = User();
  bool loading = false;
  String message='';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  submitForm() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.signIn(user.email, user.password);
      if (result == null) {
        setState(() {
          setState(() {
            message = 'Something went wrong, check your data';
          });
          loading = false;
        });
      } else {
        message = null;
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
        child: Form(
          key: _formKey,
          child: !loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                      SizedBox(height: percentege(context, 0.4)),
                      Text('Testapp',
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                      SizedBox(height: percentege(context, 0.38)),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Input('Email', (value) => user.email = value),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Input(
                            'Password', (value) => user.password = value,
                            obscureText: true),
                      ),
                      SizedBox(height: 10),
                      Text(message,  style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(height: 30),
                      Button('Sign In', Colors.red[900], Colors.red[700],
                          () => submitForm()),
                      SizedBox(height: 40),
                      Link('Sign up', () {
                        Navigator.pushNamed(context, '/logup');
                      })
                    ])
              : Center(
                  child: Column(children: <Widget>[
                  SizedBox(height: percentege(context, 0.5)),
                  Text('Loading',
                      style: TextStyle(fontSize: 40, color: Colors.white))
                ]))))),
      backgroundColor: Colors.red[700],
    );
  }
}
