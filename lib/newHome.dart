import 'package:flutter/material.dart';

class SingleProductWidget extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productModel;
  final String productPrice;

  final VoidCallback onPressed;
  SingleProductWidget({
    required this.productImage,
    required this.productName,
    required this.productModel,
    required this.productPrice,
    required this.onPressed,
  });

  @override
  _SingleProductWidgetState createState() => _SingleProductWidgetState();
}

class _SingleProductWidgetState extends State<SingleProductWidget> {
  bool isFave = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap:Widget.() {,
      onTap: widget.onPressed,
      // },
      child: Container(
        height: 60,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      scale: 2,
                      image: NetworkImage(
                        widget.productImage,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   widget.productModel,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      Text(
                        "\₹ ${widget.productPrice}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
