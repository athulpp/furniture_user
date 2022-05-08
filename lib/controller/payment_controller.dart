// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';


// PaymentController paymentController = PaymentController();

// class PaymentController extends GetxController {
//   Razorpay _razorpay = Razorpay();
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   onPay(double total_price) {
//     var options = {
//       'key': 'rzp_test_cDZYIPKnedh4R6',
//       'amount': ((total_price + 50) * 100).toString(),
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
//     };
//     _razorpay.open(options);
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     print('suceess');
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     Fluttertoast.showToast(msg: 'payment failed');
//     print('failed');
//   }
// }

// void _handleExternalWallet(ExternalWalletResponse response) {
//   // Do something when an external wallet was selected
// }
  
  // Future<void> addMyOrders(String orderId) async {
  //   try {
  //     for (var i = 0; i < cartController.cart.ProductQuantity.length; i++) {
  //       Map<String, dynamic> orderDetails = {
  //         'img': cartController.cart.productImage[i],
  //         'name': cartController.cart.productName[i],
  //         'orderId': orderId,
  //       };
  //       await _firebaseFirestore
  //           .collection('users')
  //           .doc(_firebaseAuth.currentUser!.uid)
  //           .collection('myOrders')
  //           .add(orderDetails);
  //     }
  //   } catch (e) {}
  // }


