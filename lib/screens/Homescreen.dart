import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';

import 'package:userapp/newHome.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  String cate = '';
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productStream =
        FirebaseFirestore.instance.collection('products').snapshots();
    // print(_productStream);
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: ListView(children: [
          Container(
            color: Colors.grey.shade300,
            // child: StreamBuilder<QuerySnapshot>(
            //     stream: _productStream,
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (snapshot.hasError) {
            //         print("Something went wrong");
            //       }
            //       if (snapshot.connectionState ==
            //           ConnectionState.waiting) {
            //         return Text('Loading');
            //       }
            //       return GridView.builder(
            //           shrinkWrap: true,
            //           primary: true,
            //           itemCount: snapshot.data!.docs.length,
            //           physics:const NeverScrollableScrollPhysics(),
            //           gridDelegate:
            //             const  SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             crossAxisSpacing: 1,
            //             mainAxisSpacing: 1,
            //             childAspectRatio: 0.9,
            //           ),
            //           itemBuilder: (context, index) {
            //             final DocumentSnapshot documentSnapshot =
            //                 snapshot.data!.docs[index];
            //             return Padding(
            //               padding: const EdgeInsets.all(10),
            //               child: Card(
            //                 shadowColor: Colors.white,
            //                 elevation: 10,
            //                 color: Colors.grey.shade300,
            child: SingleProductWidget(
                // productName:
                //     documentSnapshot['productname'],
                // productModel:
                //     documentSnapshot['productdes'],
                // productPrice:
                //     documentSnapshot['productprice'],
                // productImage:
                //     documentSnapshot['productimage'],
                // onPressed: () {
                //   Get.to(() => DetailScreen(
                //   productId: documentSnapshot.id,
                //   productName:
                //       documentSnapshot['productname'],
                //   productDesc:
                //       documentSnapshot['productdes'],
                //   productPrice: documentSnapshot[
                //       'productprice'],
                //   productImage: documentSnapshot[
                //       'productimage'],
                //   productQuantity: documentSnapshot[
                //       'productquantity'],
                // ));
                // },
                ),
          )
        ]
            // });
            // })))
            ));
  }
}
