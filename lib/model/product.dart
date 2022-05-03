// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

class Product {
  final String productName;
  final String productDescripition;
  String? id;
  final String prdouctPrice;
  final String productQuantity;
  final productImage;
  Product(
      {required this.productName,
      required this.productDescripition,
      this.id,
      required this.prdouctPrice,
      required this.productQuantity,
      this.productImage});

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        productName: json['productname'],
        productDescripition: json['productdesc'],
        id: json['id'],
        prdouctPrice: json['productprice'],
        productQuantity: json['productquantity'],
        productImage: json['productimage']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'ProductDescripition': productDescripition,
      'id': id,
      'prdouctPrice': prdouctPrice,
      'productQuantity': productQuantity,
      'productimage': productImage
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        productName: map['productName'] as String,
        productDescripition: map['ProductDescripition'] as String,
        id: map['id'] != null ? map['id'] as String : null,
        prdouctPrice: map['prdouctPrice'] as String,
        productQuantity: map['productQuantity'] as String,
        productImage: map['productimage'] as String);
  }
}
