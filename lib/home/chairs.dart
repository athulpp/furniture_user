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
            height: 200,
            width: 350,
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
                    fit: BoxFit.contain,
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
                          SizedBox(
                            height: 10,
                          ),
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
