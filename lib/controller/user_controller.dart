// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:userapp/model/usermodel.dart';

// // UserController userController = UserController();
// UserController userController = Get.put(UserController());

// class UserController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   UserModel? userModel;

//   void getUser() async {
//     _firestore
//         .collection('users')
//         .doc(_auth.currentUser!.uid)
//         .get()
//         .then((value) {
//       userModel = UserModel.fromJson(value.data()!);
//     });
//     update();
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     getUser();
//   }

//   getUserName() => FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get()
//       .then((value) => value.data()!['name']);
// }
