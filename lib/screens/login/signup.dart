// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/constants/material_button.dart';
// import 'package:userapp/screens/login/login_screen.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: Image.asset('assests/images/icon (2).png'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'WELCOME',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Name'),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Email'),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Password'),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       fillColor: Colors.white,
//                       filled: true,
//                       labelText: 'Confirm Password'),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 CustomButton(text: 'SIGN UP', onPressed: () {}),
//                 // SizedBox(
//                 //   height: 5,
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Already have account?',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Get.to(() => LoginScreen());
//                         },
//                         child: Text(
//                           'SIGN IN',
//                           style: TextStyle(color: Colors.black),
//                         ))
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
