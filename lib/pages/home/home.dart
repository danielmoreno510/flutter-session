import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example/models/user.dart';
import 'package:example/widgets/button.dart';
import 'package:example/services/auth.dart';
import 'package:example/utils/percentage.dart';
import 'package:example/services/database.dart';
import 'package:example/pages/home/users.dart';
import 'package:example/models/listusers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  submitForm() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<ListUsers>>.value(
      value: DatabaseService().users,
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home'),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: percentege(context, 0.1)),
          Text('Users',
              style: TextStyle(fontSize: 40, color: Colors.red[900])),
          SizedBox(height: percentege(context, 0.1)),
          Users(),
          // Text(user.uemail,
          //     style: TextStyle(fontSize: 20, color: Colors.red[900])),
          SizedBox(height: percentege(context, 0.1)),
          Button(
              'signOut', Colors.red[900], Colors.red[700], () => submitForm()),
        ],
      )))),
      backgroundColor: Colors.white,
    ));
  }
}
