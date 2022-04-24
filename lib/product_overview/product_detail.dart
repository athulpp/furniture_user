import 'package:flutter/material.dart';
import 'package:userapp/model/product.dart';
import 'package:userapp/product_overview/components/body.dart';

class DetailScreen extends StatelessWidget {
  
   DetailScreen({Key? key, required this.productId,
      required this.productName,
      required this.productDesc,
      required this.productQuantity,
      required this.productPrice,
      required this.productImage }) : super(key: key);
  final productId;
  String productName;
  String productDesc;
  String productPrice;
  String productQuantity;
  String productImage;
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: buildAppBar(context),
      body: Body(
   
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))
      ],
    );
  }
}
