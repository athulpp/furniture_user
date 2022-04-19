import 'package:flutter/material.dart';

class ProductDescripition extends StatelessWidget {
  const ProductDescripition({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
        style: TextStyle(height: 1.5, fontSize: 16),
      ),
    );
  }
}
