// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:userapp/model/cart.dart';
// import 'package:userapp/model/order.dart';

// class MyOrder extends StatelessWidget {
//   final _cartStream = FirebaseFirestore.instance
//       .collection('OrderCollection')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('order')
//       .snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: StreamBuilder<QuerySnapshot>(
//           stream: _cartStream,
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               print("Something went wrong");
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: Image.asset('assests/images/Group.png'));
//             }
//             // List<Cart>? cartList = convetToCart(snapshot.data!.docs);
//             List<Order> orderList = [];
//             for (var item in snapshot.data!.docs) {
//               orderList.add(Order.fromMap(item));
//             }

//             return Scaffold(
//               backgroundColor: Colors.grey.shade100,
//               body: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 5,
//                   child: ListView.builder(
//                     itemCount: orderList.length,

//                     itemBuilder: ((context, index) {
//                     final O = orderList[index];
//                     return ListTile(
//                       title: Text(O.cart.productName),
//                     );
//                   })),
//                 ),
//               ),
//               // bottomNavigationBar: Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //       decoration: BoxDecoration(
//               //         color: Colors.grey.shade200,
//               //         border: Border.all(
//               //           color: Colors.brown,
//               //           width: 2,
//               //         ),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //       child: Padding(
//               //         padding: const EdgeInsets.all(10),
//               //         child: Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           children: [
//               //             Text(
//               //               'Total:',
//               //               style: TextStyle(
//               //                   fontSize: 20,
//               //                   foreground: Paint()
//               //                     ..shader = ui.Gradient.linear(
//               //                       const Offset(0, 20),
//               //                       const Offset(150, 20),
//               //                       <Color>[
//               //                         Colors.black,
//               //                         Colors.grey,
//               //                       ],
//               //                     )),
//               //             ),
//               //             Container(
//               //                 height: 30,
//               //                 width: 150,
//               //                 decoration: BoxDecoration(
//               //                     border:
//               //                         Border.all(color: Colors.brown.shade100),
//               //                     borderRadius: BorderRadius.circular(10)),
//               //                 child: Center(
//               //                   child: Text(
//               //                     '₹ ${sum(cartList)}',
//               //                     style: TextStyle(
//               //                         color: Colors.black,
//               //                         fontWeight: FontWeight.bold,
//               //                         fontSize: 22),
//               //                   ),
//               //                 )),
//               //             Container(
//               //               height: 40,
//               //               decoration: BoxDecoration(
//               //                   color: Colors.deepOrange,
//               //                   border:
//               //                       Border.all(color: Colors.green.shade200),
//               //                   borderRadius: BorderRadius.circular(6)),
//               //               child: TextButton(
//               //                 onPressed: () {
//               //                   Get.to(() => AllAddressScreen(
//               //                         total: sum(cartList),
//               //                         cartList: cartList,
//               //                       ));
//               //                 },
//               //                 child: Text(
//               //                   'Place Order',
//               //                   style: TextStyle(color: Colors.white),
//               //                 ),
//               //               ),
//               //             )
//               //           ],
//               //         ),
//               //       )),
//               // ),
//             );
//           }),
//     );
//   }

//   List<Cart> convetToCart(List<QueryDocumentSnapshot<Object?>> docs) {
//     List<Cart> cartList = [];
//     for (var element in docs) {
//       cartList.add(Cart.fromMap(element));
//       print('$cartList  the product lsit');
//     }
//     return cartList;
//   }
// }

// sum(List<Cart> cartList) {
//   double sumProd = 0.0;
//   for (var cart in cartList) {
//     sumProd +=
//         int.parse(cart.ProductQuantity) * double.parse(cart.productPrice);

//     print(sumProd);

//     // print(cartList);
//   }
//   print(sumProd);
//   return sumProd;
// }

// quantity(List<Cart> cartList) {
//   double quantity = 0;
//   for (var cart in cartList) {
//     quantity = double.parse(cart.ProductQuantity);
//   }
//   return quantity;
// }

// class CartProductCard extends StatelessWidget {
//   CartProductCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
//               image: DecorationImage(image: NetworkImage(''))),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Text(
//               //   productname,
//               //   style: Theme.of(context).textTheme.headline6,
//               // ),
//               // Text(productPrice, style: Theme.of(context).textTheme.headline6),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         // Row(
//         //   children: [IconButton(onPressed: () {
//         //     // FirebaseFirestore.instance.collection('cartCollection').doc(FirebaseAuth.instance.currentUser!.uid).collection('cart').doc(docume)
//         //   }, icon: Icon(Icons.remove))],
//         // ),
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
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/model/order.dart';

import 'package:userapp/screens/my_order/my_order_detail.dart';

class MyOrder extends StatelessWidget {
  MyOrder({Key? key}) : super(key: key);
  final _cartStream = FirebaseFirestore.instance
      .collection('OrderCollection')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('order')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("My Order"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: StreamBuilder<QuerySnapshot>(
                stream: _cartStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {}
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Image.asset('assests/images/Group.png'));
                  }
                  List<Order> orderList = [];
                  for (var item in snapshot.data!.docs) {
                    orderList.add(Order.fromMap(item));
                  }
                  return ListView.separated(
                    itemCount: orderList.length,
                    itemBuilder: ((context, index) {
                      final each = orderList[index];
                      List<Order> e = orderList;
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => MyOrderDetailsScreen(
                                  order: e,
                                  productId: each.cart.cartId,
                                  username: each.address.name.toString(),
                                  address: each.address.address.toString(),
                                  phonNo: each.address.PhoneNumber.toString(),
                                  pin: each.address.pincode.toString(),
                                  orderName: each.cart.productName,
                                  orderDes: each.cart.productDes,
                                  orderId: each.orderId,
                                  orderImage: each.cart.productImage,
                                  orderPrice: each.totalPrice,
                                  Quantity: each.cart.ProductQuantity,
                                  OrderDate: each.createdDate,
                                  status: each.status,
                                ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              width: double.infinity,
                              height: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: new BorderRadius.only(
                                  topRight: const Radius.circular(40.0),
                                ),
                              ),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      height: 80,
                                      child: Image.network(
                                        each.cart.productImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Qty: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(each.cart.ProductQuantity,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Amount',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  each.totalPrice.toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                          each.cart.productName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              each.status,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.5),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  );

                  return CircularProgressIndicator();
                })));
  }

  double getCartTOtalPrice(Order order) {
    return (order.totalPrice);
  }
}
