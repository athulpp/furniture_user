import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:userapp/home/chairs.dart';
import 'package:userapp/newHome.dart';

import 'package:userapp/product_overview/product_detail.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final Stream<QuerySnapshot> _productStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: ,
        body: Column(children: [
          Expanded(
              child: Container(
                  color: Colors.grey.shade100,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _productStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print("Something went wrong");
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading');
                        }
                        return GridView.builder(
                            shrinkWrap: true,
                            primary: true,
                            itemCount: snapshot.data!.docs.length,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];
                              return SingleProductWidget(
                                productName: documentSnapshot['productname'],
                                productModel: documentSnapshot['productdes'],
                                productPrice: documentSnapshot['productprice'],
                                productImage: documentSnapshot['productimage'],
                                onPressed: () {
                                  Get.to(() => DetailScreen(
                                        productId: documentSnapshot.id,
                                        productName:
                                            documentSnapshot['productname'],
                                        productDesc:
                                            documentSnapshot['productdes'],
                                        productPrice:
                                            documentSnapshot['productprice'],
                                        productImage:
                                            documentSnapshot['productimage'],
                                        productQuantity:
                                            documentSnapshot['productquantity'],
                                      ));
                                },
                              );
                            });
                      })))
        ]));
  }
}
