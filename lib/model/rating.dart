// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:userapp/model/cart.dart';
import 'package:userapp/model/order.dart';

class Rating {
  Order order;
  final id;
  double rate;
  String comments;

  Rating(
      {required this.id,
      required this.rate,
      required this.comments,
      required this.order});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rate': rate,
      'comments': comments,
      'order': order.toMap()
    };
  }

  factory Rating.fromMap(dynamic map) {
    return Rating(
      id: map['id'],
      rate: map['rate'] as double,
      comments: map['comments'] as String,
      order: Order.fromMap(map['cart'] as Map<String, dynamic>),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source) as Map<String, dynamic>);
}
