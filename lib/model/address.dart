class Address {
  final id;
  String? name;
  String? address;
  String? pincode;
  String? PhoneNumber;

  Address({this.id, this.name, this.address, this.pincode,this.PhoneNumber});
  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "address": address, "pincode": pincode,"phoneNumber":PhoneNumber};

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        pincode: json['pincode'],
        PhoneNumber: json['phoneNumber']);
  }

  // static fromMap(Map<String, dynamic> map) {}

  // toMap() {}
}
