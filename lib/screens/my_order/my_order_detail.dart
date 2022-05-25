import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
            title: Text(
              'Order Summary',
              style: GoogleFonts.actor(fontWeight: FontWeight.bold),
            ),
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
              

                  (status == 'cancelled' || status == 'Rejected')
                      ? const SizedBox()
                      : GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 75,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red),
                              child: TextButton(
                                onPressed: () {
                                  CancelOrd(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.actor(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Text(
                    orderName,
                    style: GoogleFonts.actor(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    borderOnForeground: true,
                    color: Colors.grey.shade300,
                    shadowColor: Colors.brown,
                    type: MaterialType.button,
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      width: size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Details",
                            style: GoogleFonts.actor(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Row(
                            children: [
                              Text(
                                'Order Id :',
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                              ),
                              Text(
                                orderId.toString().substring(
                                      0,
                                      20,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    letterSpacing: 2),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  'Total Price : ',
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                ),
                                Text(
                                  '₹ ${orderPrice}',
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Text(
                                    'Status : ',
                                    style: GoogleFonts.actor(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                  (status == 'Rejected')
                                      ? Text(
                                          ' $status',
                                          style: GoogleFonts.adventPro(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.red),
                                        )
                                      : Text(
                                          ' $status',
                                          style: GoogleFonts.adventPro(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.green),
                                        ),
                                ],
                              )),
                          Row(
                            children: [
                              Text(
                                'Ordered on :',
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                              ),
                              Text(
                                '  ${DateTime.fromMicrosecondsSinceEpoch(OrderDate.microsecondsSinceEpoch).toString().substring(0, 10)}',
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w300, fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    borderOnForeground: true,
                    color: Colors.grey.shade300,
                    shadowColor: Colors.brown,
                    type: MaterialType.button,
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      width: size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address Details",
                            style: GoogleFonts.actor(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Row(
                            children: [
                              Text(
                                'Name :',
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                              ),
                              Text(
                                ' $username',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.actor(
                                    fontWeight: FontWeight.w300, fontSize: 20),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Address :',
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                ),
                                Flexible(
                                  child: Text(
                                    ' $address',
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: GoogleFonts.actor(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Text(
                                    'Phone No : ',
                                    style: GoogleFonts.actor(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    ' $phonNo',
                                    style: GoogleFonts.almarai(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
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
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                ),
                                Text(
                                  ' ${pin}',
                                  style: GoogleFonts.almarai(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
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

  Future CancelOrd(BuildContext context) {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: "Order",
      desc: "Do You Want to Cancel this order",
      buttons: [
        DialogButton(
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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
          color: const Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
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
