import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:userapp/model/cart.dart';

CartController cartController = CartController();

class CartController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late Cart cart;
  bool isLoading = true, isAlreadyAvailable = false;

  Future<String> addToCart(Cart item) async {
    // isLoading = true;
    // update();
    String res = 'Some error occured';
    try {
      DocumentReference<Map<String, dynamic>> cartUser = FirebaseFirestore
          .instance
          .collection('cartCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await cartUser
          .collection('cart')
          .doc(item.cartId)
          .set(item.toJson())
          .then((value) {
        // checkIfAlreadyInCart();
      });
      res = 'success';
    } catch (err) {
      print('...........$err');
    }
    return res;
  }

  Future<String> checkIfAlreadyInCart() async {
    String res = 'some error';
    try {
      await firebaseFirestore
          .collection('cartCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .where('id', isEqualTo: cart.cartId)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          isAlreadyAvailable = true;
        }
        isLoading = false;
        update();
      });
    } catch (e) {
      print(e);
    }
    return res;
  }

  Future<String> quantity(Cart cart) async {
    print(cart.ProductQuantity);
    String res = 'Some error occured';
    try {
      DocumentReference<Map<String, dynamic>> cartUser = FirebaseFirestore
          .instance
          .collection('cartCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await cartUser
          .collection('cart')
          .doc(cart.cartId)
          .update(cart.toJson())
          .then((value) {
        // checkIfAlreadyInCart();
      });
      res = 'success';
    } catch (err) {
      print('...........$err');
    }
    return res;
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
}
