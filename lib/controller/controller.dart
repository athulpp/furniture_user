import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:userapp/model/product.dart';
import 'package:userapp/model/rating.dart';
import 'package:userapp/model/usermodel.dart';
import 'package:userapp/screens/login/login_screen/login..dart';

Controller controller = Get.put(Controller());

class Controller extends GetxController {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    update(["indexchange"]);
  }

  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  String? errorMessage;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  signUp(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {createUser()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);

      debugPrint(error.code);
    }
  }

  createUser() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    userModel.name = firstNameEditingController.text;
    userModel.lastName = secondNameEditingController.text;
    userModel.uid = user!.uid;
    userModel.emailId = user.email;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account Created Sucessfully");
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('collection');
  String productId = '';
  List<Product> productData = [];

  Future<void> getProducts() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    debugPrint(allData.toString());
  }

  ///search screen control
  List<QueryDocumentSnapshot<Map<String, dynamic>>> searchResults = [];
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> searchProducts(
      String query) async {
    print('search');
    try {
      final data = await fireStore
          .collection('products')
          .where('productname', isGreaterThanOrEqualTo: query)
          .get();

      searchResults.addAll(data.docs);
      update(['search']);

      debugPrint(data.docs.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return searchResults;
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();

    Get.offAll(() => const Login());
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('products')
        .where('productname', isGreaterThanOrEqualTo: queryString)
        .get();
  }

  var selectPayment = "".obs;

  onChangePayment(var payment) {
    selectPayment.value = payment;
  }

  Future<String> addRating(Rating rating) async {
    Product? product;
    String res = 'Some error occured';
    try {
      DocumentReference<Map<String, dynamic>> rating1 =
          FirebaseFirestore.instance.collection('products').doc();
      await rating1.collection('rating').doc(rating.id).set(rating.toMap());

      res = 'success';
    } catch (err) {
      debugPrint(err.toString());
    }
    return res;
  }

  onclickedProuctId(var prod) {
    productId = prod;
    update(['productId']);
  }
}
