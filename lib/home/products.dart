// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/home/chairs.dart';
// import 'package:userapp/product_overview/product_overview.dart';

// import '../constants/const.dart';

// class ProductList extends StatelessWidget {
//   const ProductList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var list = ['tables', 'chairs', 'sofa'];
//     var prices = ['5000', '3000', '8000'];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('Product List'),
//       ),
//       body: SafeArea(
//           child: ListView.separated(
//               itemBuilder: ((context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Container(
//                     width: 100,
//                     padding: EdgeInsets.only(left: 0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                     ),
//                     height: 120,
//                     child: ListTile(
//                       onTap: () {
//                         Get.to(() => ProductOverView());
//                       },
//                       contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
//                       title: Row(
//                         children: [
//                           Center(
//                             child: Container(
//                               width: 300,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                       'https://m.media-amazon.com/images/I/71+xw4gRDDL._SX569_.jpg'),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       trailing: Column(
//                         children: [
//                           Text('tables'),
//                           HeightSize,
//                           Text('5000'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(
//                     thickness: 5,
//                   ),
//               itemCount: 10)),
//     );
//   }
// }
