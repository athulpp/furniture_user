import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/constants/const.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final buttonColor;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:
              GoogleFonts.adventPro(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
