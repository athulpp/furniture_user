// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/screens/checkout/checkout.dart';

// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Method'),
//         backgroundColor: Colors.black,
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             // Row(
//             //   children: [
//             //     IconButton(
//             //       onPressed: () {
//             //         Get.back();
//             //       },
//             //       icon: const Icon(Icons.arrow_back_ios),
//             //     ),
//             //     const SizedBox(
//             //       width: 320,
//             //       child: Text(
//             //         "Payment Method",
//             //         textAlign: TextAlign.center,
//             //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.to(() => CheckOutScreen());
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Card(
//                   color: Colors.grey.shade300,
//                   child: Container(
//                     padding: EdgeInsets.all(15),
//                     width: 400,
//                     height: 50,
//                     color: Colors.grey.shade100,
//                     child: Text('Cash on Delivery'),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               onTap: () {
//                 // Get.to(() => LoginScreen());
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Card(
//                   color: Colors.grey.shade300,
//                   child: Container(
//                     padding: EdgeInsets.all(15),
//                     width: 400,
//                     height: 50,
//                     color: Colors.grey.shade100,
//                     child: Text('online Payment'),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Image.network(
//                 'https://miro.medium.com/max/1400/1*XTELftMnEBmFVQrBs3pRqg.png')
//           ],
//         ),
//       ),
//     );
//   }
// }
