import 'package:flutter/material.dart';

import 'package:userapp/profile/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: const [
          ProfileBody(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
