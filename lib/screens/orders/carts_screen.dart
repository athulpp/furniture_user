

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/cart_controller.dart';
import 'package:userapp/controller/controller.dart';
import 'package:userapp/model/product.dart';

import 'package:userapp/shipping%20address/address_new.dart';

class CartScreen extends StatelessWidget {
  final _cartStream = FirebaseFirestore.instance
      .collection('cartCollection')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('cart')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: StreamBuilder<QuerySnapshot>(
          stream: _cartStream,
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
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  print(documentSnapshot);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [],
                        // ),
                        //
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(20, 20)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot['image']))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    documentSnapshot['name'],
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(documentSnapshot['price'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('cartCollection')
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection('cart')
                                          .doc(documentSnapshot.id)
                                          .delete();
                                    },
                                    icon: Icon(Icons.remove))
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_circle),
                                ),
                                Text('1'),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add_circle),
                                ),
                              ],
                            )
                          ],
                        ),
                        // CartProductCard()
                        Divider(
                          thickness: 2,
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'Subtotal',
                        //         style: Theme.of(context).textTheme.headline5,
                        //       ),
                        //       Text(
                        //         '5647',
                        //         style: Theme.of(context).textTheme.headline5,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  );
                });
          }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Container(
          color: Colors.grey,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey.shade200),
                onPressed: () {
                  Get.to(() => DeliveryAddress());
                },
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CartProductCard extends StatelessWidget {
//   CartProductCard(
//       {Key? key,
//       required this.id,
//       required this.productname,
//       required this.productPrice,
//       required this.productQuantity,
//       required this.productImage})
//       : super(key: key);
//   final id;
//   String productname;

//   String productPrice;
//   String productQuantity;
//   String productImage;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
//               image: DecorationImage(image: NetworkImage(productImage))),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 productname,
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//               Text(productPrice, style: Theme.of(context).textTheme.headline6),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Row(
//           children: [IconButton(onPressed: () {
//             FirebaseFirestore.instance.collection('cartCollection').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').doc(docume)
//           }, icon: Icon(Icons.remove))],
//         ),
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.remove_circle),
//             ),
//             Text('1'),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.add_circle),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
