// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/model/product.dart';
// import 'package:userapp/screens/Homescreen.dart';
// import 'package:userapp/screens/login/signup.dart';

// import '../../constants/material_button.dart';
// import '../../controller/bottom_bar_control.dart';

// class LoginScreen extends StatelessWidget {

//   const LoginScreen({Key? key,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 10),
//           child: SingleChildScrollView(
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Center(child: Image.asset('assests/images/icon (2).png')),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Hello ! ',
//                   style: TextStyle(fontSize: 35, color: Colors.grey),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'WELCOME BACK',
//                   style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Email'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Password'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Forget Password',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//                 CustomButton(
//                   text: 'Log In',
//                   onPressed: () {
//                     Get.to(() => BottomNavigation());
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           Get.to(() => SignUpScreen());
//                         },
//                         child: Text(
//                           'SIGN UP',
//                           style: TextStyle(fontSize: 20, color: Colors.black),
//                         )),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
