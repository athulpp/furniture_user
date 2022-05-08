class Cart {
  final cartId;
  String productName;
  String productDes;
  String productPrice;
  String ProductQuantity;
  String productImage;

  Cart(
      {this.cartId,
      required this.productName,
      required this.productDes,
      required this.productPrice,
      required this.ProductQuantity,
      required this.productImage});

  Map<String, dynamic> toJson() => {
        'id': cartId,
        "name": productName,
        'des': productDes,
        "price": productPrice,
        "quantity": ProductQuantity,
        "image": productImage
      };
  static Cart fromJson(dynamic json) {
    return Cart(
        cartId: json['id'],
        productName: json['name'],
        productDes: json['des'],
        productPrice: json['price'],
        ProductQuantity: json['quantity'],
        productImage: json['image']);
  }

  static fromMap(Map<String, dynamic> map) {}

  toMap() {}
}
