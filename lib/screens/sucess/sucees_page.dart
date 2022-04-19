import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/constants/material_button.dart';
import 'package:userapp/model/product.dart';
import 'package:userapp/screens/Homescreen.dart';

import '../../controller/bottom_bar_control.dart';

class SucessScreen extends StatelessWidget {

  const SucessScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(child: Text('SUCCESS!')),
          SizedBox(
            height: 50,
          ),
          Image.asset('assests/images/Group.png'),
          SizedBox(
            height: 5,
          ),
          Image.asset('assests/images/checkmark-circle-fill.png'),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: Text(
              'Your order will be delivered soon.\n Thank you for choosing our app!',
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(
            buttonColor: Colors.black,
              text: 'Back To Home ',
              onPressed: () {
                // Get.to(() => HomeScreen(,));
                Get.to(() => BottomNavigation());
              })
        ],
      )),
    );
  }
}
