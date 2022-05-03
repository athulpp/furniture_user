import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/product_overview/product_detail.dart';
import 'package:userapp/screens/wishlist/wishlist.dart';

class WishList extends StatelessWidget {
  WishList({Key? key}) : super(key: key);
  final _favStream = FirebaseFirestore.instance
      .collection('FavCollections')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Fav')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _favStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading');
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return WishListContent(
                  onPressed: () {
                    print('working');
                    Get.to(() => DetailScreen(
                        productId: documentSnapshot.id,
                        productName: documentSnapshot['name'],
                        productDesc: documentSnapshot['des'],
                        productPrice: documentSnapshot['price'],
                        productImage: documentSnapshot['image'],
                        productQuantity: documentSnapshot['quantity']));
                  },
                  productId: documentSnapshot.id,
                  productName: documentSnapshot['name'],
                  productDesc: documentSnapshot['des'],
                  productPrice: documentSnapshot['price'],
                  productImage: documentSnapshot['image'],
                  productQuantity: documentSnapshot['quantity'],
                );
              }),
            );
          }),
    );
  }

  // Widget positionedRemove() {
  //   return
  // }
}
