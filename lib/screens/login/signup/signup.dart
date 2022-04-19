import 'package:flutter/material.dart';
import 'package:userapp/screens/login/signup/component/signup_body.dart';


class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SignupBody() ,
      
    );
  }
}