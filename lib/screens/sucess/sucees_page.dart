import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:userapp/constants/material_button.dart';

import '../../controller/bottom_bar_control.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            'SUCCESS!',
            style: GoogleFonts.adventPro(
                fontSize: 36, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 50,
          ),
          Image.asset('assests/images/Group.png'),
          const SizedBox(
            height: 5,
          ),
  
          SizedBox(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: Lottie.asset('assests/images/sucess.json')),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Your order will be delivered soon.\n Thank you for choosing our app!',
                            style: GoogleFonts.bilbo(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 64, 40, 31)),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            )),
          ),

          SizedBox(
            width: 200,
            child: CustomButton(
                buttonColor: Colors.black,
                text: 'Back To Home ',
                onPressed: () {
                  Get.to(() => BottomNavigation());
                }),
          )
        ],
      )),
    );
  }
}
