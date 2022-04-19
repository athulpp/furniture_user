import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:userapp/screens/login/login_screen/login_body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
