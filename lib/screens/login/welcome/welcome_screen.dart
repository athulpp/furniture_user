import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:userapp/screens/login/welcome/component/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.home)),
              WelcomeBody(),
            ],
          ),
        ),
      ),
    );
  }
}
