import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:userapp/controller/bottom_bar_control.dart';
import 'package:userapp/screens/login/login_screen/login..dart';

class HomeTo extends StatelessWidget {
  const HomeTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BottomNavigation(
                currentIndex: 0,
              );
            } else {
              return Login();
            }
          }),
    );
  }
}
