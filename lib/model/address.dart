class Address {
  final id;
  String? name;
  String? address;
  String? pincode;

  Address({this.id, this.name, this.address, this.pincode});
  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "address": address, "pincode": pincode};

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        pincode: json['pincode']);
  }
}
