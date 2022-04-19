import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/screens/wishlist/wishlist.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Text(
      //     'WishList',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: ListView.builder(
          // shrinkWrap: true,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return WishListContent();
          })),
    );
  }
}
