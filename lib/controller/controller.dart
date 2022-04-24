import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:userapp/model/usermodel.dart';

Controller controller = Get.put(Controller());

class Controller extends GetxController {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    update(["indexchange"]);
  }

  // final quantity = 0.obs;
  // void increment() => quantity.value++;
  // void decrement() => quantity.value--;
  // void reset() => quantity.value = 0;

// creating new user

  // Future<String> createUser({
  //   required  id,
  //   String? name,
  //   String? lastname,
  //   String? emailid,
  // }) async {
  //   final firestore = FirebaseFirestore.instance;

  //   try {
  //     if (id.isNotEmpty ||
  //         name!.isNotEmpty ||
  //         lastname!.isNotEmpty ||
  //         emailid!.isNotEmpty) ;

  //     // UserModel user =
  //     //     UserModel(id: id, name: name, lastName: lastname, emailId: emailid);
  //     // firestore.collection('Users').doc(id).set(user.toJson());

  //   } catch (e) {
  //     print(e);
  //   }
  //   return id;
  // }
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  String? errorMessage;
  final auth = FirebaseAuth.instance;

  // signup function

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
      print(error.code);
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
        .set(userModel.toJson());

    Fluttertoast.showToast(msg: "Account Created Sucessfully");
  }
}
