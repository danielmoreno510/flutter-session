import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example/models/user.dart';
import 'package:example/pages/signin/signin.dart';
import 'package:example/pages/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Signin();
    } else {
      return Home();
    }
  }
}
