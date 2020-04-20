import 'package:example/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example/pages/wrapper.dart';
import 'package:example/pages/signin/signin.dart';
import 'package:example/pages/home/home.dart';
import 'package:example/pages/signup/signup.dart';

import 'package:example/models/user.dart';

void main() => runApp(MyApp(
  
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/',
        routes:{
          '/': (context) => Wrapper(),
          '/login': (context) => Signin(),
          '/home': (context) => Home(),
          '/logup': (context) => Signup()
        }
      )
      
    );
  }
}
