import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assests/images/main_top.png',
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assests/images/login_bottom.png',
              width: size.width * 0.4,
            ),
          ),
          child
        ]),
      ),
    );
  }
}
