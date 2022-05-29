

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletons/skeletons.dart';
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
                    return SkeletonItem(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.circle,
                                    width: 50,
                                    height: 50),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: SkeletonParagraph(
                                  style: SkeletonParagraphStyle(
                                      lines: 3,
                                      spacing: 6,
                                      lineStyle: SkeletonLineStyle(
                                        randomLength: true,
                                        height: 10,
                                        borderRadius: BorderRadius.circular(8),
                                        minLength:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        maxLength:
                                            MediaQuery.of(context).size.width /
                                                3,
                                      )),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          SkeletonParagraph(
                            style: SkeletonParagraphStyle(
                                lines: 3,
                                spacing: 6,
                                lineStyle: SkeletonLineStyle(
                                  randomLength: true,
                                  height: 10,
                                  borderRadius: BorderRadius.circular(8),
                                  minLength:
                                      MediaQuery.of(context).size.width / 2,
                                )),
                          ),
                          const SizedBox(height: 12),
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: double.infinity,
                              minHeight: MediaQuery.of(context).size.height / 8,
                              maxHeight: MediaQuery.of(context).size.height / 3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          width: 20, height: 20)),
                                  SizedBox(width: 8),
                                  SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          width: 20, height: 20)),
                                  SizedBox(width: 8),
                                  SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          width: 20, height: 20)),
                                ],
                              ),
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 16,
                                    width: 64,
                                    borderRadius: BorderRadius.circular(8)),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return SizedBox(
                      height: 600,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 200,
                              height: 200,
                              child: Lottie.asset('assests/images/order.json')),
                          Text(
                            'No Orders',
                            style: GoogleFonts.bungee(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                                color: const Color.fromARGB(255, 64, 40, 31)),
                          ),
                        ],
                      )),
                    );
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:const EdgeInsets.only(left: 20),
                                    height: 80,
                                    child: Image.network(
                                      each.cart.productImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                const  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                   const   SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        each.cart.productName,
                                        style:const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Column(
                                        children: [
                                      const    SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                          const    Text(
                                                'Amount',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                        const      SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                each.totalPrice.toString(),
                                                style:const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                               const   Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                 const     SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                     const     Text(
                                            'Qty: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(each.cart.ProductQuantity,
                                              style:const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                   const   SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                     const     SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            each.status,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style:const TextStyle(
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
                      );
                    }),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  );

               
                })));
  }

  double getCartTOtalPrice(Order order) {
    return (order.totalPrice);
  }
}
