import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:userapp/controller/order_control.dart';
import 'package:userapp/model/address.dart';
import 'package:userapp/model/cart.dart';
import 'package:userapp/model/order.dart';

import 'package:userapp/screens/my_order/my_order.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  MyOrderDetailsScreen(
      {Key? key,
      required this.productId,
      required this.username,
      required this.address,
      required this.phonNo,
      required this.pin,
      required this.orderName,
      required this.orderDes,
      required this.orderId,
      required this.orderImage,
      required this.orderPrice,
      required this.Quantity,
      required this.OrderDate,
      required this.status,
      required this.order})
      : super(key: key);
  final productId;
  String username;
  String address;
  String phonNo;
  String pin;
  String orderName;
  final orderDes;
  final orderId;
  final orderImage;
  double orderPrice;
  String Quantity;
  Timestamp OrderDate;
  String status;
  List<Order> order;

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Order Summary'),
            backgroundColor: Colors.black,
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Container(
                    height: size.height / 5,
                    width: size.width / 1.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(orderImage.toString()),
                      ),
                    ),
                  ),
                  // ProductRating(

                  (status == 'cancelled')
                      ? SizedBox()
                      : TextButton(
                          onPressed: () {
                            cancelOrderDialog(context);
                          },
                          child: Text('Cancel'))

                  // ),
                  // GetBuilder<Controller>(
                  //     id: productId,
                  //     builder: (context) {
                  //       return ProductRating(
                  //         productId: productId,
                  //         orderId: orderId,
                  //         address: address,
                  //         createdDate: OrderDate,
                  //         name: orderName,
                  //         phoneNo: phonNo,
                  //         pincode: pin,
                  //         productDes: orderDes,
                  //         productImage: orderImage,
                  //         productPrice: orderPrice.toString(),
                  //         productQuantity: Quantity,
                  //         productname: orderName,
                  //         status: status,
                  //         totalPrice: orderPrice,
                  //       );
                  //     }),
                  ,
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Text(
                    orderName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Material(
                    elevation: 5,
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      width: size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order Details",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Row(
                            children: [
                              Text(
                                'Order Id :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                orderId.toString().substring(
                                      0,
                                      20,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  'Total Price : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  '₹ ${orderPrice}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          // Text('Paid amount :'),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Text(
                                    'Status : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    ' $status',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.red),
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                'Ordered on :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                '  ${DateTime.fromMicrosecondsSinceEpoch(OrderDate.microsecondsSinceEpoch).toString().substring(0, 10)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 5,
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      width: size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Address Details",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                ' $username',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),

                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Address :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Flexible(
                                    child: Text(
                                      ' $address',
                                      overflow: TextOverflow.visible,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              )),
                          // Text('Paid amount :'),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(vertical: 12),
                          //   // child:Row(children: [Text('Status')],) Text('Status : $status'),
                          // ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Text(
                                    'Phone No : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    ' $phonNo',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Pincode : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    ' ${pin}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              )),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 12),
                          //   child: text('Delivered on :', '28-10-2021'),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void cancelOrder(List<Order> cartList, double totalPrice, Address addres) {
    List<Order> orderList = [];
    for (var order in cartList) {
      orderList.add(Order(
          orderId: orderId,
          userId: FirebaseAuth.instance.currentUser!.uid,
          createdDate: OrderDate,
          cart: Cart(
              productName: orderName,
              productDes: orderDes,
              productPrice: orderPrice.toString(),
              ProductQuantity: Quantity,
              productImage: orderImage),
          address: addres,
          status: 'cancelled',
          totalPrice: totalPrice));
    }
    for (var order in orderList) {
      orderController.cancelOrder(order);
    }
  }

  Future cancelOrderDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: const Text('Are you sure want to cancel this order'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cancelOrder(
                  order,
                  orderPrice,
                  Address(
                      name: username,
                      address: address,
                      PhoneNumber: phonNo,
                      pincode: pin));
              Get.off(() => MyOrder());
            },
            child: const Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }
}

// Widget orderDetails(Size size, each) {
//   Widget text(String header, String footer) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           header,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         Text(
//           footer,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }

//   return Material(
//     elevation: 5,
//     color: Colors.white,
//     child: Container(
//       padding: const EdgeInsets.symmetric(
//         vertical: 20,
//         horizontal: 15,
//       ),
//       width: size.width / 1.1,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Order Details",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(
//             height: size.height / 40,
//           ),
//           text('Order Id :', each),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: text('Total Price :', 'model.totalPrice.toString()'),
//           ),
//           text('Paid amount :', 'model.totalPrice.toString()'),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child:
//                 text('Status :', 'model.status == 0 ?' 'Pending' ': Delivered'),
//           ),
//           text('Ordered on :', '11-12-2021'),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(vertical: 12),
//           //   child: text('Delivered on :', '28-10-2021'),
//           // ),
//         ],
//       ),
//     ),
//   );
// }
