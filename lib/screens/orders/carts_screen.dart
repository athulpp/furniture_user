import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/model/cart.dart';
// import 'package:userapp/screens/shipping_address/add_new_address.dart';
import 'package:userapp/shipping%20address/address.dart';
// import 'package:userapp/controller/cart_controller.dart';
// import 'package:userapp/controller/controller.dart';
// import 'package:userapp/model/product.dart';
// import 'package:userapp/screens/orders/counter.dart';

// import 'package:userapp/shipping%20address/address_new.dart';

class CartScreen extends StatelessWidget {
  final _cartStream = FirebaseFirestore.instance
      .collection('cartCollection')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('cart')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<QuerySnapshot>(
          stream: _cartStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Image.asset('assests/images/Group.png'));
            }
            List<Cart>? cartList = convetToCart(snapshot.data!.docs);
            return Scaffold(
              backgroundColor: Colors.grey.shade100,
              body:

                  // sum(cartList);
                  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        print(documentSnapshot);
                        return InkWell(
                          onTap: (() {
                            Get.to(() => AddAdressScreen());
                          }),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            documentSnapshot['name'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(documentSnapshot['price'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6),
                                              Spacer(),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.remove_circle),
                                              ),
                                              Text(
                                                  documentSnapshot['quantity']),
                                              IconButton(
                                                onPressed: () {
                                                  increment(adding) {
                                                    adding++;
                                                  }
                                                },
                                                icon: Icon(Icons.add_circle),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                Card(
                                  color: Colors.grey.shade100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Remove from the Cart',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
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
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),

              // bottomNavigationBar: BottomAppBar(
              //   color: Colors.grey,
              //   child: Container(
              //     color: Colors.grey,
              //     height: 70,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         ElevatedButton(
              //           style: ElevatedButton.styleFrom(primary: Colors.grey.shade200),
              //           onPressed: () {
              //             Get.to(() => AddressScreen());
              //           },
              //           child: Text(
              //             'Checkout',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .headline6!
              //                 .copyWith(color: Colors.black),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              bottomNavigationBar: SizedBox(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('total price ${sum(cartList)}'),
                    TextButton(
                        onPressed: () {
                          Get.to(() => AddressScreen());
                        },
                        child: Text('Proceed'))
                  ],
                ),
              )),
            );
          }),
    );
  }

  List<Cart> convetToCart(List<QueryDocumentSnapshot<Object?>> docs) {
    List<Cart> cartList = [];
    for (var element in docs) {
      cartList.add(Cart.fromJson(element));
      print('$cartList  the product lsit');
    }
    return cartList;
  }
}

sum(List<Cart> cartList) {
  double sumProd = 0.0;
  for (var cart in cartList) {
    sumProd =
        int.parse(cart.ProductQuantity!) * double.parse(cart.productPrice!);
    print(sumProd);
  }
  return sumProd;
}

quantity(List<Cart> cartList) {
  double quantity = 0;
  for (var cart in cartList) {
    quantity = double.parse(cart.ProductQuantity!);
  }
  return quantity;
}

increment(List<Cart> adding) {
  int incement = 1;
  for (var add in adding) {
    incement = int.parse(add.ProductQuantity!);
    incement++;
    quantity(adding);
  }
}

class CartProductCard extends StatelessWidget {
  CartProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
              image: DecorationImage(image: NetworkImage(''))),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   productname,
              //   style: Theme.of(context).textTheme.headline6,
              // ),
              // Text(productPrice, style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        // Row(
        //   children: [IconButton(onPressed: () {
        //     // FirebaseFirestore.instance.collection('cartCollection').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').doc(docume)
        //   }, icon: Icon(Icons.remove))],
        // ),
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
    );
  }
}
