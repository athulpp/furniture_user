import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/cart_controller.dart';
import 'package:userapp/model/address.dart';
import 'dart:ui' as ui;
import 'package:userapp/model/cart.dart';
import 'package:userapp/model/order.dart';
import 'package:userapp/product_overview/product_detail.dart';

import 'package:userapp/shipping%20address/all_address.dart';

class CartScreen extends StatelessWidget {
  final _cartStream = FirebaseFirestore.instance
      .collection('cartCollection')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('cart')
      .snapshots();
  // List<Cart> convertToCart(AsyncSnapshot<QuerySnapshot<Object?>> snap) {
  //   List<Cart> cartList = [];
  //   for (var element in snap) {
  //     cartList.add(Cart.fromJson(element));
  //   }
  //   return cartList;
  // }

  void placeOrder(
    List<Cart> cartList,
    double totalPrice,
    Address addres,
  ) {
   List<Order> orderList = [];
    for (var cart in cartList) {
      orderList.add(Order(createdDate: Timestamp.now(), cart: cart, address: addres, status: 'delivered', totalPrice: totalPrice));
    }
  }

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
              body: Padding(
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
                            Get.to(
                              () => DetailScreen(
                                productId: documentSnapshot.id,
                                productName: documentSnapshot['name'],
                                productDesc: documentSnapshot['des'],
                                productPrice: documentSnapshot['price'],
                                productImage: documentSnapshot['image'],
                                productQuantity: documentSnapshot['quantity'],
                              ),
                            );
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
                                              Text(
                                                  '₹ ${documentSnapshot['price']}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6),
                                              Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    border: Border.all(
                                                      color: Colors.black12,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  if (int.parse(
                                                          documentSnapshot[
                                                              'quantity']) >
                                                      1) {
                                                    int x = int.parse(
                                                        documentSnapshot[
                                                            'quantity']);
                                                    x = x - 1;
                                                    cartController.quantity(Cart(
                                                        cartId:
                                                            documentSnapshot[
                                                                'id'],
                                                        ProductQuantity:
                                                            x.toString(),
                                                        productDes:
                                                            documentSnapshot[
                                                                'des'],
                                                        productImage:
                                                            documentSnapshot[
                                                                'image'],
                                                        productName:
                                                            documentSnapshot[
                                                                'name'],
                                                        productPrice:
                                                            documentSnapshot[
                                                                'price']));
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  color: Colors.brown,
                                                ),
                                              ),
                                              Text(
                                                documentSnapshot['quantity'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  int x = int.parse(
                                                      documentSnapshot[
                                                          'quantity']);
                                                  x = x + 1;
                                                  print('$x ghfdfhgf');
                                                  cartController.quantity(Cart(
                                                      cartId: documentSnapshot[
                                                          'id'],
                                                      ProductQuantity:
                                                          x.toString(),
                                                      productDes:
                                                          documentSnapshot[
                                                              'des'],
                                                      productImage:
                                                          documentSnapshot[
                                                              'image'],
                                                      productName:
                                                          documentSnapshot[
                                                              'name'],
                                                      productPrice:
                                                          documentSnapshot[
                                                              'price']));
                                                },
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Colors.brown,
                                                ),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Remove from the Cart',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                      ),
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
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(
                        color: Colors.brown,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 20,
                                foreground: Paint()
                                  ..shader = ui.Gradient.linear(
                                    const Offset(0, 20),
                                    const Offset(150, 20),
                                    <Color>[
                                      Colors.black,
                                      Colors.grey,
                                    ],
                                  )),
                          ),
                          Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.brown.shade100),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  '₹ ${sum(cartList)}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              )),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                border:
                                    Border.all(color: Colors.green.shade200),
                                borderRadius: BorderRadius.circular(6)),
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => AllAddressScreen(
                                      total: sum(cartList),
                                      cartList:cartList,
                                    ));
                              },
                              child: Text(
                                'Place Order',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
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
    sumProd +=
        int.parse(cart.ProductQuantity) * double.parse(cart.productPrice);

    print(sumProd);

    // print(cartList);
  }
  print(sumProd);
  return sumProd;
}

quantity(List<Cart> cartList) {
  double quantity = 0;
  for (var cart in cartList) {
    quantity = double.parse(cart.ProductQuantity);
  }
  return quantity;
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
