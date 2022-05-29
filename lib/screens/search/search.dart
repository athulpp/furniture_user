import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:userapp/product_overview/product_detail.dart';

class ProductSearch extends SearchDelegate {
 final  CollectionReference _firebaseFireStore =
      FirebaseFirestore.instance.collection('products');

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.blueGrey, // affects AppBar's background color
        // hintColor: Colors.grey, // affects the initial 'Search' text
        // ignore: deprecated_member_use
        textTheme: TextTheme(
            headline6: TextStyle(
                // headline 6 affects the query text
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFireStore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['productname']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String productname = data.get('productname');
                  final String image = data.get('productimage');
                  return SizedBox(
                    height: 60,
                    child: Material(
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => DetailScreen(
                                productId: data.id,
                                productName: data['productname'],
                                productDesc: data['productdes'],
                                productPrice: data['productprice'],
                                productImage: data['productimage'],
                                productQuantity: data['productquantity'],
                              ));
                        },
                        leading: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                        title: Text(productname),
                      ),
                    ),
                  );
                })
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assests/images/search.json'),
        const Text(
          'Search Your Furniture',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    ));
  }
}
