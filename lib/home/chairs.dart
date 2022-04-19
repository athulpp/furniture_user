import 'package:flutter/material.dart';

class ChairsList extends StatelessWidget {
  ChairsList(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productPrice})
      : super(key: key);
  final String productImage;
  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 220,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.brown.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Image.network(
                    productImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 140,
                  child: Container(
                    width: 160,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productPrice,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.brown),
                          ),
                          Spacer(),
                          Text(
                            productName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          // //
                          // Stack(
                          //   children: <Widget>[
                          //     // Stroked text as border.
                          //     Text(
                          //       productPrice,
                          //       style: TextStyle(
                          //         fontSize: 40,
                          //         foreground: Paint()
                          //           ..style = PaintingStyle.stroke
                          //           ..strokeWidth = 6
                          //           ..color = Colors.blue,
                          //       ),
                          //     ),
                          //     // Solid text as fill.
                          //     Text(
                          //       productPrice,
                          //       style: TextStyle(
                          //         fontSize: 40,
                          //         color: Colors.grey[300],
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   productName,
                          //   style: TextStyle(
                          //       inherit: true,
                          //       fontSize: 26.0,
                          //       color: Colors.pink,
                          //       shadows: [
                          //         Shadow(
                          //             // bottomLeft
                          //             offset: Offset(-1.5, -1.5),
                          //             color: Colors.white),
                          //         Shadow(
                          //             // bottomRight
                          //             offset: Offset(1.5, -1.5),
                          //             color: Colors.white),
                          //         Shadow(
                          //             // topRight
                          //             offset: Offset(1.5, 1.5),
                          //             color: Colors.white),
                          //         Shadow(
                          //             // topLeft
                          //             offset: Offset(-1.5, 1.5),
                          //             color: Colors.white),
                          //       ]),
                          // )

                          // Text(productPrice)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
