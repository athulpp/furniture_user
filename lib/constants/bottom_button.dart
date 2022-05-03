import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final BorderRadius? radius;
  final Function function;
  final double buttonWidth;

  const BottomButton(
      {required this.text,
      required this.buttonWidth,
      required this.function,
      this.radius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => function(),
      child: Material(
        elevation: 5,
        borderRadius: radius ?? BorderRadius.circular(20),
        color: const Color.fromRGBO(30, 62, 160, 1),
        child: Container(
          height: size.height / 17,
          width: size.width / buttonWidth,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width / 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}