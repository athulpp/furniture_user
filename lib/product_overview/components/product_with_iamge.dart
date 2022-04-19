import 'package:flutter/material.dart';

class ProductWithImage extends StatelessWidget {
  const ProductWithImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 40),
      child: Column(
        children: [
          Text(
            "Dining Table",
            style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: 'Price\n'),
                  TextSpan(
                      text: "4000",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Image.asset('assests/images/pngegg.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
