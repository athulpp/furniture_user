class Favorite {
  String? productId;
  String? productName;
  String? productDes;
  String? productPrice;

  String? ProductQuantity;
  String? productImage;

  Favorite(
      {this.productId,
      this.productName,
      this.productDes,
      this.productPrice,
      this.ProductQuantity,
      this.productImage});

  Map<String, dynamic> toJson() => {
        'id': productId,
        "name": productName,
        "des": productDes,
        "price": productPrice,
        "quantity": ProductQuantity,
        "image": productImage
      };
  static Favorite fromJson(Map<String, dynamic> json) {
    return Favorite(
        productId: json['id'],
        productName: json['name'],
        productDes: json['des'],
        productPrice: json['price'],
        ProductQuantity: json['quantity'],
        productImage: json['image']);
  }
}
