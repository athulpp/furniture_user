// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class HomeCategoryScreen extends StatefulWidget {
//    HomeCategoryScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeCategoryScreen> createState() => _HomeCategoryScreenState();
// }

// class _HomeCategoryScreenState extends State<HomeCategoryScreen> {
//   String cate = '';

//   @override
//   Widget build(BuildContext context) {
//      final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance
//       .collection('products')
//       .where(['productCategory'], isEqualTo: cate).snapshots();
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 50,
//             child: ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     if(cate=='table'){
//                       setState(() {

//                       });
//                     }
//                   },
//                   child: Text('Tables'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Tables'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Tables'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Tables'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Tables'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Tables'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Tables'),
//                 ),
//               ],
//             ),
//           ),

//         ],
//       )),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreens extends StatelessWidget {
//   const HomeScreens({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size size = Get.size;
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//           child: Scaffold(
//         body: SizedBox(
//           height: size.height,
//           width: size.width,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: size.height / 3,
//                   width: size.width / 1.1,
//                   child: PageView.builder(itemBuilder: ((context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: NetworkImage(
//                                   'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'))),
//                     );
//                   })),
//                 ),
//                 SizedBox(
//                   height: size.height / 17,
//                   width: size.width / 1.05,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       for (int i = 0; i < 4; i++) indicator(size, false)
//                     ],
//                   ),
//                 ),
//                 categoriesTitle(size, "All Categories"),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }

//   Widget listViewBuilder(Size size) {
//     return SizedBox(
//       height: size.height / 9,
//       width: size.width,
//       child: ListView.builder(
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             return Container();
//           }),
//     );
//   }

//   Widget listViewBuilderItems(Size size, Categoires categoires ) {
//     return Container(
//       height: size.height/10,
//       width: size.width/3,
//       child: Column(children: [],),
//     );
//   }

//   Widget categoriesTitle(Size size, String title) {
//     return SizedBox(
//       height: size.height / 17,
//       width: size.width / 1.05,
//       child: Row(
//         children: [
//           Text(title),
//         ],
//       ),
//     );
//   }

//   Widget indicator(Size size, bool isSelected) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Container(
//         height: isSelected ? size.height / 80 : size.height / 100,
//         width: isSelected ? size.height / 80 : size.height / 100,
//         decoration:
//             const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
//       ),
//     );
//   }
// }
