import 'package:flutter/material.dart';
import 'package:example/widgets/input.dart';
import 'package:example/widgets/button.dart';
import 'package:example/widgets/radio.dart';
import 'package:example/utils/percentage.dart';
import 'package:example/models/signup.dart';
import 'package:example/services/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  User user = User();
  String gender='Male';
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  submitForm() async{
    if (_formKey.currentState.validate()) {
      setState(() {
          loading = true;
        });
      dynamic result = await _auth.signUp(user.email, user.password, user.firstname, user.lastname, user.phone, gender);
      if (result == null) {
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        setState(() {
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Sign Up'),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Form(
          key: _formKey,
          child: !loading
              ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: percentege(context, 0.2)),
                Text('Welcome to Tesapp',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Input('Fist Name', (value) => user.firstname = value),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Input('Last Name', (value) => user.lastname = value),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Input('Email', (value) => user.email = value),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Input('Phone', (value) => user.phone = value),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Input('Password', (value) => user.password = value, obscureText: true),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(unselectedWidgetColor: Colors.white70),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RadioButton(
                          'Male',
                          gender,
                          (value) {
                            user.gender = value;
                            setState(() {
                              gender = value;
                            });
                          },
                          Colors.white,
                        ),
                        SizedBox(width: 40),
                        RadioButton(
                          'Female',
                          gender,
                          (value) {
                            user.gender = value;
                            setState(() {
                              gender = value;
                            });
                          },
                          Colors.white,
                        ),
                      ]),
                ),
                SizedBox(height: 60),
                Button('Sign Up', Colors.red[900], Colors.red[700],
                    () => submitForm()),
              ]): Center(
                  child: Column(children: <Widget>[
                  SizedBox(height: percentege(context, 0.5)),
                  Text('Loading',
                      style: TextStyle(fontSize: 40, color: Colors.white))
                ]))))),
      backgroundColor: Colors.red[700],
    );
  }
}
