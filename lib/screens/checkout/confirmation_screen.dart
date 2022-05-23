import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:userapp/controller/cart_controller.dart';

import 'package:userapp/controller/controller.dart';
import 'package:userapp/controller/order_control.dart';
import 'package:userapp/model/address.dart';
import 'package:userapp/model/cart.dart';
import 'package:userapp/model/order.dart';
import 'package:userapp/screens/sucess/failed_page.dart';
import 'package:userapp/screens/sucess/sucees_page.dart';
import 'package:userapp/shipping%20address/address.dart';
import 'package:uuid/uuid.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen(
      {Key? key,
      required this.id,
      required this.addressName,
      required this.addressAdd,
      required this.AddressPin,
      required this.phoneNo,
      required this.total,
      required this.cartList})
      : super(key: key);

  var id;
  String addressName;
  String addressAdd;
  String AddressPin;
  String phoneNo;
  var total;
  List<Cart> cartList;

  Razorpay _razorpay = Razorpay();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    final Size size = Get.size;

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Confirmation",
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 24),
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         print('this is my cart list .......${cartList}');
            //       },
            //       icon: Icon(Icons.abc))
            // ],
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                addressCard(
                    size, id, addressName, addressAdd, AddressPin, context),
                SizedBox(
                  height: size.height / 30,
                ),
                orderDetails(size),
                SizedBox(
                  height: size.height / 30,
                ),
                paymentType(size)
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              //  ?controller.selectPayment.value = 'Razorpayment':controller.selectPayment.value='CashonDelivery';
              if (controller.selectPayment.value == 'Razorpayment') {
                onPay(total);
                print('hello');
                // placeOrder();
              } else {
                print('cash on delivery');
                Alert(
                  context: context,
                  type: AlertType.none,
                  title: "Cash on Delivery",
                  desc: "Do You want to Place this Order",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        placeOrder(
                            cartList,
                            total,
                            Address(
                                address: addressAdd,
                                name: addressName,
                                pincode: AddressPin,
                                PhoneNumber: phoneNo));
                        Get.to(() => SucessScreen());
                        cartRemove(cartList);
                      },
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.redAccent]),
                    )
                  ],
                ).show();
              }
            },
            child: Container(
              height: size.height / 12,
              width: size.width / 1.2,
              color: Colors.black,
              alignment: Alignment.center,
              child: Text(
                "Pay Now",
                style: GoogleFonts.adventPro(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addressCard(Size size, id, name, address, pincode, context) {
    return Material(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: GoogleFonts.aleo(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Address",
                        desc: "Do You want to change the address",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Yes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Get.to(() => EditAddress(
                                    id: id,
                                    name: name,
                                    address: addressAdd,
                                    pincode: pincode,
                                    phoneNumber: phoneNo,
                                  ));
                            },
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: Text(
                              "No",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            gradient: LinearGradient(
                                colors: [Colors.red, Colors.redAccent]),
                          )
                        ],
                      ).show();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                address,
                style: GoogleFonts.aleo(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              pincode,
              style:
                  GoogleFonts.aleo(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                phoneNo,
                style:
                    GoogleFonts.aleo(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderDetails(Size size) {
    Widget text(String header, String footer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: GoogleFonts.alata(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            footer,
            style: GoogleFonts.alata(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Material(
      borderRadius: BorderRadius.circular(20),
      borderOnForeground: true,
      color: Colors.grey.shade300,
      shadowColor: Colors.brown,
      type: MaterialType.button,
      elevation: 5,
      // color: Colors.white,
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
              "Price Details",
              style: GoogleFonts.radley(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            text('Total Price:', 'Rs. ${total}'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: text('Delivery charge:', 'Rs.${20}'),
            ),
            text('Payable Price :', 'Rs. ${total + 20}'),
          ],
        ),
      ),
    );
  }

  Widget paymentType(Size size) {
    return Material(
        borderRadius: BorderRadius.circular(20),
        borderOnForeground: true,
        color: Colors.grey.shade300,
        shadowColor: Colors.brown,
        type: MaterialType.button,
        elevation: 5,
        // color: Colors.white,
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 15,
            ),
            width: size.width / 1.1,
            child: Obx(() {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Cash on Delivery',
                        style: GoogleFonts.cambay(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Radio(
                          activeColor: Colors.green,
                          value: 'CashonDelivery',
                          groupValue: controller.selectPayment.value,
                          onChanged: (value) {
                            controller.onChangePayment(value);
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Razor Payment',
                        style: GoogleFonts.cambay(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Radio(
                          activeColor: Colors.green,
                          value: 'Razorpayment',
                          groupValue: controller.selectPayment.value,
                          onChanged: (value) {
                            controller.onChangePayment(value);
                          }),
                    ],
                  )
                ],
              );
            })));
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    placeOrder(
        cartList,
        total,
        Address(
            address: addressAdd,
            name: addressName,
            pincode: AddressPin,
            PhoneNumber: phoneNo));
    Get.to(() => SucessScreen());
    cartRemove(cartList);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.off(() => FailedPage());
  }

  onPay(double total_price) {
    var options = {
      'key': 'rzp_test_cDZYIPKnedh4R6',
      'amount': ((total_price + 20) * 100).toString(),
      'name': addressName,
      'description': addressAdd,
      'prefill': {'contact': phoneNo, 'email': 'test@razorpay.com'}
    };
    _razorpay.open(options);
  }
}

void placeOrder(List<Cart> cartList, double totalPrice, Address addres) {
  List<Order> orderList = [];
  var order_id = Uuid();
  for (var cart in cartList) {
    orderList.add(Order(
        orderId: order_id.v1(),
        userId: FirebaseAuth.instance.currentUser!.uid,
        createdDate: Timestamp.now(),
        cart: cart,
        address: addres,
        status: 'Pending',
        totalPrice: getCartTOtalPrice(cart) + 20));
  }
  for (var order in orderList) {
    orderController.createOrder(order);
  }
}

double getCartTOtalPrice(Cart cart) {
  return double.parse(cart.ProductQuantity) * double.parse(cart.productPrice);
}

void cartRemove(List<Cart> cartList) {
  for (var cart in cartList) {
    cartController.cartDelete(cart);
  }
}
