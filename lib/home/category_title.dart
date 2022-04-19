import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  CategoryTitle({Key? key, required this.product}) : super(key: key);
  final product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          (Text(product)),
        ],
      ),
    );
  }
}
