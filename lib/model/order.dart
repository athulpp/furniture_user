// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:userapp/model/address.dart';
import 'package:userapp/model/cart.dart';

class Order {
  String? orderId;
  Timestamp createdDate;
  Cart cart;
  Address address;
  String status;
  double totalPrice;

  Order({
    required this.orderId,
    required this.createdDate,
    required this.cart,
    required this.address,
    required this.status,
    required this.totalPrice,
  });

  // Map<String, dynamic> toJson() {}

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'orderId': orderId,
  //     'createdDate': createdDate.millisecondsSinceEpoch,
  //     'cart': cart.toMap(),
  //     'address': address.toJson(),
  //     'status': status,
  //     'totalPrice': totalPrice,
  //   };
  // }

  // factory Order.fromMap(dynamic map) {
  //   print(
  //       "orderId :   ${map['orderId']} status:    ${map['status']}  totalPrice:   ${map['totalPrice']} address:  ${map['address']} cart:  ${map['cart']} createDate ${map['createDate']} ");
  // //   return Order(
  //     orderId: map['orderId'] ?? '',
  //     createdDate: map['createDate'],
  //     cart: Cart.fromMap(map['cart'] as Map<String, dynamic>),
  //     address: Address.fromJson(map['address'] as Map<String, dynamic>),
  //     status: map['status'] as String,
  //     totalPrice: map['totalPrice'] as double,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Order.fromJson(String source) =>
  //     Order.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'createdDate': createdDate,
      'cart': cart.toMap(),
      'address': address.toJson(),
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  factory Order.fromMap(dynamic map) {
    print(
        "orderId :   ${map['orderId'] ?? "orderId is empty"} status:    ${map['status'] ?? "status is empty"}   totalPrice:   ${map['totalPrice'] ?? "totalprice is empty"} address:  ${map['address'] ?? "address is empty"}          cart:  ${map['cart'] ?? "cart is empty"} createDate ${map['createdDate'] ?? "createDate is empty"} ");

    return Order(
      orderId: map['orderId'] ?? "",
      createdDate: map['createdDate'] ?? "",
      cart: Cart.fromMap(map['cart'] as Map<String, dynamic>),
      address: Address.fromJson(map['address'] as Map<String, dynamic>),
      status: map['status'] ?? "" as String,
      totalPrice: map['totalPrice'] ?? 0.0 as double,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Order.fromJson(String source) =>
  //     Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
