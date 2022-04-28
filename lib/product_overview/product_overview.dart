// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/screens/sucess/sucees_page.dart';

// import '../constants/material_button.dart';
// import '../controller/bottom_bar_control.dart';

// class ProductOverView extends StatelessWidget {
//   const ProductOverView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color(0xffcdc1c1),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             // Navigator.of(context).pushReplacement(MaterialPageRoute(
//             //     builder: (BuildContext context) => BottomNavigation(product: p,)));
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//               padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//               child: Container(
//                   width: double.infinity,
//                   height: 320,
//                   decoration: new BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       image: new DecorationImage(
//                           fit: BoxFit.cover,
//                           image: new NetworkImage(
//                               "https://m.media-amazon.com/images/I/71+xw4gRDDL._SX569_.jpg"))))),
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//             child: Text('Minimal Stand '),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("₹ 5000"),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.add),
//                     ),
//                     Text('1'),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.remove),
//                     ),
//                     IconButton(
//                         onPressed: () {}, icon: Icon(Icons.list_alt_outlined))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
//             child: Text(
//                 'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
//           ),
//           CustomButton(
//             buttonColor: Colors.black,
//             onPressed: () {
//               Get.to(() => SucessScreen());
//             },
//             text: 'Add To Cart',
//           )
//         ],
//       ),
//     );
//   }
// }
