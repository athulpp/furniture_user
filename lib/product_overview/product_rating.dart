// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'package:userapp/model/address.dart';
// import 'package:userapp/model/cart.dart';
// import 'package:userapp/model/order.dart';
// import 'package:userapp/model/rating.dart';

// class ProductRating extends StatelessWidget {
//   ProductRating(
//       {Key? key,
//       required this.productId,
//       required this.orderId,
//       required this.createdDate,
//       required this.productname,
//       required this.productPrice,
//       required this.totalPrice,
//       required this.productQuantity,
//       required this.productImage,
//       required this.name,
//       required this.address,
//       required this.pincode,
//       required this.phoneNo,
//       required this.status,
//       required this.productDes})
//       : super(key: key);
//   final productId;
//   final orderId;
//   final createdDate;
//   final productname;
//   String productPrice;
//   final productQuantity;
//   final productImage;
//   final productDes;
//   final name;
//   final address;
//   final pincode;
//   final phoneNo;
//   final status;
//   double totalPrice;

//   TextEditingController comments = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: RatingBar.builder(
//             tapOnlyMode: false,
//             updateOnDrag: true,
//             initialRating: 3,
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               switch (index) {
//                 case 0:
//                   return Icon(
//                     Icons.sentiment_very_dissatisfied,
//                     color: Colors.red,
//                   );
//                 case 1:
//                   return Icon(
//                     Icons.sentiment_dissatisfied,
//                     color: Colors.redAccent,
//                   );
//                 case 2:
//                   return Icon(
//                     Icons.sentiment_neutral,
//                     color: Colors.amber,
//                   );
//                 case 3:
//                   return Icon(
//                     Icons.sentiment_satisfied,
//                     color: Colors.lightGreen,
//                   );
//                 case 4:
//                   return Icon(
//                     Icons.sentiment_very_satisfied,
//                     color: Colors.green,
//                   );
//               }
//               return CircularProgressIndicator();
//             },
//             onRatingUpdate: (rating) {
//               UpdateSelectionIntent;
//               addRating(Rating(
//                   id: orderId,
//                   rate: rating,
//                   comments: comments.text,
//                   order: Order(
//                       orderId: orderId,
//                       createdDate: createdDate,
//                       cart: Cart(
//                           productName: productname,
//                           productDes: productDes,
//                           productPrice: productPrice,
//                           ProductQuantity: productQuantity,
//                           productImage: productImage),
//                       address: Address(
//                           name: name,
//                           address: address,
//                           pincode: pincode,
//                           PhoneNumber: phoneNo),
//                       status: 'Delivered in 7 days',
//                       totalPrice: totalPrice)));
//             },
//           ),
//         ),
//         TextFormField(
//           controller: comments,
//         ),
//       ],
//     );
//   }

//   Future<String> addRating(Rating rating) async {
//     String res = 'Some error occured';
//     try {
//       FirebaseFirestore.instance
//           .collection('products')
//           .doc(productId)
//           .collection('ratings')
//           .doc(orderId)
//           .set(rating.toMap());

//       res = 'success';
//     } catch (err) {
//       print('...........$err');
//     }
//     return res;
//   }

//   List<Rating> totalRating(List<QueryDocumentSnapshot<Object?>> docs) {
//     List<Rating> ratingList = [];
//     for (var element in docs) {
//       ratingList.add(Rating.fromMap(element));
//       print('$ratingList  the product lsit');
//     }
//     return ratingList;
//   }

// //   sum(List<Rating> ratingList) {
// //   double totalAvg = 0.0;

// //   for (var rate in ratingList) {
// //     totalAvg=(rate.rate*n)/n

// //     // print(cartList);

// //   return totalAvg ;
// // }
// // }
// }
