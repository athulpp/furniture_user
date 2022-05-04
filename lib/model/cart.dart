class Cart {
  final cartId;
  String productName;
  String productPrice;
  String ProductQuantity;
  String productImage;

  Cart(
      {this.cartId,
      required this.productName,
      required this.productPrice,
      required this.ProductQuantity,
      required this.productImage});

  Map<String, dynamic> toJson() => {
        'id': cartId,
        "name": productName,
        "price": productPrice,
        "quantity": ProductQuantity,
        "image": productImage
      };
  static Cart fromJson(dynamic json) {
    return Cart(
        cartId: json['id'],
        productName: json['name'],
        productPrice: json['price'],
        ProductQuantity: json['quantity'],
        productImage: json['image']);
  }
}
