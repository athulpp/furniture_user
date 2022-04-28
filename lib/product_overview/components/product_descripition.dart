import 'package:flutter/material.dart';

class ProductDescripition extends StatelessWidget {
  ProductDescripition({Key? key, required this.productDesc}) : super(key: key);
  String productDesc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        productDesc,
        style: TextStyle(height: 1.5, fontSize: 16),
      ),
    );
  }

  prod() {
    print(productDesc);
  }
}
