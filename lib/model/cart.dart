class Cart {
  String? productId;
  String? productName;
  String? productPrice;
  String? ProductQuantity;
  String? productImage;

  Cart(
      {this.productId,
      this.productName,
      this.productPrice,
      this.ProductQuantity,this.productImage});

  Map<String, dynamic> toJson() => {
        'id': productId,
        "name": productName,
        "price": productPrice,
        "quantity": ProductQuantity,
        "image":productImage
      };
  static Cart fromJson(Map<String, dynamic> json) {
    return Cart(
        productId: json['id'],
        productName: json['name'],
        productPrice: json['price'],
        ProductQuantity: json['quantity'],
        productImage: json['image']);
  }
}
