import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/constants/material_button.dart';
import 'package:userapp/main.dart';
import 'package:userapp/screens/login/login_screen/login..dart';
import 'package:userapp/screens/login/signup/signup.dart';
import 'package:userapp/screens/login/welcome/component/welcome_background.dart';

import 'package:userapp/screens/wishlist/wishlist.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundImage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'MAKE YOUR  HOME BEAUTIFUL',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Image.asset('assests/images/Furniture 04.jpg'),
          CustomButton(
            onPressed: () {
              Get.to(() => Login());
            },
            text: 'Login',
            buttonColor: Colors.brown,
          ),
          CustomButton(
            onPressed: () {
              Get.to(() => SignUp());
            },
            text: "Signup",
            buttonColor: Colors.brown.shade200,
          )
        ],
      ),
    );
  }
}
