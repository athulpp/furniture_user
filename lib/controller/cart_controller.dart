import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:userapp/model/cart.dart';

CartController cartController = CartController();

class CartController extends GetxController {
  Future<String> addToCart(Cart item) async {
    String res = 'Some error occured';
    try {
      DocumentReference<Map<String, dynamic>> cartUser = FirebaseFirestore
          .instance
          .collection('cartCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await cartUser.collection('cart').doc(item.productId).set(item.toJson());
      res = 'success';
    } catch (err) {
      print('...........$err');
    }
    return res;
  }
}
