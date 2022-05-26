import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescripition extends StatelessWidget {
  ProductDescripition({Key? key, required this.productDesc}) : super(key: key);
  String productDesc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        productDesc,
        style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 18),
      ),
    );
  }
}
