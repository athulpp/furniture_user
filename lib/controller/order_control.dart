import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:userapp/model/order.dart';

OrderController orderController = OrderController();

class OrderController extends GetxController {
  Future<String> createOrder(Order order) async {
    String res = 'Some error occured';

    try {
      FirebaseFirestore.instance
          .collection('OrderCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('order')
          .doc(order.orderId)
          .set(order.toMap());
      res = 'success';
    } catch (err) {
      debugPrint(err.toString());
    }
    return res;
  }

  Future<String> cancelOrder(Order order) async {
    String res = 'Some error occured';

    try {
      FirebaseFirestore.instance
          .collection('OrderCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('order')
          .doc(order.orderId)
          .update(order.toMap());
      res = 'success';
    } catch (err) {
      debugPrint(err.toString());
    }
    return res;
  }
}
