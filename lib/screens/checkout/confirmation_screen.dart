import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:userapp/controller/cart_controller.dart';

import 'package:userapp/controller/controller.dart';
import 'package:userapp/controller/order_control.dart';
import 'package:userapp/model/address.dart';
import 'package:userapp/model/cart.dart';
import 'package:userapp/model/order.dart';
import 'package:userapp/screens/sucess/sucees_page.dart';

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

  // final controller = Get.put(ConfirmationScreenController());
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
            title: const Text("Confirmation"),
            actions: [
              IconButton(
                  onPressed: () {
                    print('this is my cart list .......${cartList}');
                  },
                  icon: Icon(Icons.abc))
            ],
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                addressCard(size, id, addressName, addressAdd, AddressPin),
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
              }
            },
            child: Container(
              height: size.height / 12,
              width: size.width / 1.2,
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                "Pay Now",
                style: TextStyle(
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

  Widget addressCard(Size size, id, name, address, pincode) {
    return Material(
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
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                address,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              pincode,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              phoneNo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            footer,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Material(
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
              "Price Details",
              style: TextStyle(
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
              child: text('Delivery charge:', 'Rs.${50}'),
            ),
            text('Payable Price :', 'Rs. ${total + 50}'),
          ],
        ),
      ),
    );
  }

  Widget paymentType(Size size) {
    return Material(
        elevation: 5,
        color: Colors.white,
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
                      Text('Cash on Delivery'),
                      Radio(
                          value: 'CashonDelivery',
                          groupValue: controller.selectPayment.value,
                          onChanged: (value) {
                            controller.onChangePayment(value);
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Razor Payment'),
                      Radio(
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
    print('failed');
  }

  onPay(double total_price) {
    var options = {
      'key': 'rzp_test_cDZYIPKnedh4R6',
      'amount': ((total_price + 50) * 100).toString(),
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    _razorpay.open(options);
  }
}

void placeOrder(
  List<Cart> cartList,
  double totalPrice,
  Address addres,
) {
  List<Order> orderList = [];

  for (var cart in cartList) {
    orderList.add(Order(
        createdDate: Timestamp.now(),
        cart: cart,
        address: addres,
        status: 'delivered',
        totalPrice: getCartTOtalPrice(cart)));
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
