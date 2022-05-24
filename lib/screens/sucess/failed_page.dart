import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:userapp/controller/bottom_bar_control.dart';

class FailedPage extends StatelessWidget {
  const FailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 191, 191),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Payment Failed',
                            style: GoogleFonts.amarante(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.redAccent),
                          )),
                      SizedBox(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Lottie.asset(
                                      'assests/images/error.json')),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    'Your Payment Failed Try Again!',
                                    style: GoogleFonts.bilbo(
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 64, 40, 31)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (ctx) => BottomNavigation(
                                              currentIndex: 0,
                                            )),
                                    (route) => false);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              child: Text(
                                'Continue Shopping',
                                style: GoogleFonts.alef(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
