// import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:userapp/constants/material_button.dart';
// import 'package:userapp/product_overview/components/product_descripition.dart';

// import 'package:userapp/product_overview/components/product_with_iamge.dart';
// import 'package:userapp/product_overview/product_rating.dart';

// class Body extends StatelessWidget {
//   Body(
//       {Key? key,
//       required this.productId,
//       required this.productName,
//       required this.productDesc,
//       required this.productPrice,
//       required this.productImage})
//       : super(
//           key: key,
//         );
//   final productId;
//   String productName;
//   String productDesc;
//   String productPrice;

//   String productImage;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(
//             height: size.height,
//             child: Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: size.height * 0.3),
//                   height: 500,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(24),
//                         topRight: Radius.circular(24)),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 80,
//                       ),
//                       ProductRating(),
//                       // ProductDescripition(
//                       //   // productDesc: productDesc,
//                       // ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(top: 20, left: 20, right: 20),
//                         child: Text(
//                           productDesc,
//                           style: TextStyle(height: 1.5, fontSize: 16),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10, right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CartCounter(),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.bookmark_border,
//                                   size: 40,
//                                 ))
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       CustomButton(
//                         buttonColor: Colors.black,
//                         text: 'Buy Now'.toUpperCase(),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 ProductWithImage()
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CartCounter extends StatefulWidget {
//   const CartCounter({Key? key}) : super(key: key);

//   @override
//   State<CartCounter> createState() => _CartCounterState();
// }

// class _CartCounterState extends State<CartCounter> {
//   int numOfItems = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 10,
//         ),
//         SizedBox(
//           width: 50,
//           height: 40,
//           child: OutlinedButton(
//             onPressed: () {
//               if (numOfItems > 1) {
//                 setState(() {
//                   numOfItems--;
//                 });
//               }
//             },
//             child: Icon(Icons.remove),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Text(
//           numOfItems.toString().padLeft(2, "0"),
//           style: Theme.of(context).textTheme.headline6,
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         SizedBox(
//           width: 50,
//           height: 40,
//           child: OutlinedButton(
//             onPressed: () {
//               setState(() {
//                 numOfItems++;
//               });
//             },
//             child: Icon(Icons.add),
//           ),
//         ),
//       ],
//     );
//   }
// }
