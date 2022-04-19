// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/screens/login/login_screen.dart';

// import '../../constants/material_button.dart';

// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//             child: Column(
//           children: [
//             SizedBox(
//               height: 80,
//             ),
//             Image.asset('assests/images/icon (2).png'),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'MAKE YOUR ',
//               style: TextStyle(color: Colors.grey, fontSize: 35),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'HOME BEAUTIFUL ',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Text(
//                   'The best simple place where you discover most wonderful furnitures and make your home beautiful',
//                   style: TextStyle(color: Colors.grey, fontSize: 20)),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             CustomButton(
//               text: 'Get Started',
//               onPressed: () {
//                 Get.to(() => LoginScreen());
//               },
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
