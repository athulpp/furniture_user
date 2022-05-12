import 'package:flutter/material.dart';

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
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Payment Failed',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    const Center(
                        child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 80,
                      child: Icon(
                        Icons.error,
                        size: 140,
                        color: Colors.white,
                      ),
                    )),
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
                            child: const Text('Continue Shopping')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
