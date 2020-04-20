import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/models/listusers.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<ListUsers>>(context);
    return Column(
    children: [ for(var user in users)
    Column(
      children: [
        Text(user.firstname+' '+user.lastname,
              style: TextStyle(fontSize: 20, color: Colors.red[900])),
              SizedBox(height: 10),
              Text(user.phone,
              style: TextStyle(fontSize: 20, color: Colors.red[900])),
              SizedBox(height: 10),
              Text(user.gender,
              style: TextStyle(fontSize: 20, color: Colors.red[900])),
              Text('_________________________', style: TextStyle(fontSize: 20, color: Colors.red[900])),
              SizedBox(height: 20),
      ])
    ]);
  }
}