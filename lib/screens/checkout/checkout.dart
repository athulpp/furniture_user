// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../constants/const.dart';
// import '../../constants/material_button.dart';
// import '../sucess/sucees_page.dart';

// class CheckOutScreen extends StatelessWidget {
//   const CheckOutScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             heightSize,
           
//             heightSize,
//             InkWell(
//               onTap: () {
//                 // Get.to(() => LoginScreen());
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Card(
//                   color: Colors.grey.shade300,
//                   shadowColor: Colors.grey,
//                   child: Container(
//                     padding: EdgeInsets.all(15),
//                     width: 400,
//                     height: 100,
//                     color: Colors.grey.shade100,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Athul',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Divider(
//                           thickness: 1,
//                         ),
//                         Text('Kubz padamugal junction kochi,eranakulam,kerala'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             heightSize,
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Card(
//                 color: Colors.grey.shade300,
//                 shadowColor: Colors.grey,
//                 child: Container(
//                   padding: EdgeInsets.all(15),
//                   width: 400,
//                   height: 100,
//                   color: Colors.grey.shade100,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ListTile(
//                         leading: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Order:',
//                               style: TextStyle(),
//                             ),
//                             Text('Delivery:'),
//                             Text('Total'),
//                           ],
//                         ),
//                         trailing: Column(
//                           children: [Text('5000'), Text('100'), Text('5500')],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             heightSize,
//             CustomButton(
//               buttonColor: Colors.black,
//               onPressed: () {
//                 Get.to(() => SucessScreen());
//               },
//               text: 'SUBMIT ORDER',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
