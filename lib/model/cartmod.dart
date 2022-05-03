// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:userapp/model/product.dart';

// class CartModel {
//   Product? product;
//   String? cartId;
//   int? noOfProd;
//   CartModel({
//     this.product,
//     this.cartId,
//     this.noOfProd,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'product': product,
//       'cartId': cartId,
//       'noOfProd': noOfProd,
//     };
//   }

//   factory CartModel.fromMap(Map<String, dynamic> map) {
//     return CartModel(
//       product: map['product'] ,
//       cartId: map['cartId'] != null ? map['cartId'] as String : null,
//       noOfProd: map['noOfProd'] != null ? map['noOfProd'] as int : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }
