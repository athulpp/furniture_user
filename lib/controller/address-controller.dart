import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/model/address.dart';

AddressControl addressControl = AddressControl();

class AddressControl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<String> addAddress(Address add) async {
    String res = 'Some error occured';
    try {
      DocumentReference<Map<String, dynamic>> user_address = FirebaseFirestore
          .instance
          .collection('AddressCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await user_address
          .collection('address')
          .doc(add.name)
          .set(add.toJson())
          .then((value) {});
      res = 'success';
    } catch (err) {
      print('...........$err');
    }
    return res;
  }

  Future<String> updateAddress(Address address) async {
    String res = 'some error';
    try {
      DocumentReference<Map<String, dynamic>> user_address = FirebaseFirestore
          .instance
          .collection('AddressCollection')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await user_address
          .collection('address')
          .doc(address.name)
          .update(address.toJson())
          .then((value) {});
    } catch (e) {
      print(e);
    }
    return res;
  }

  Future<String> deleteAddress(Address address) async {
    String res = 'error';
    DocumentReference<Map<String, dynamic>> user_address = FirebaseFirestore
        .instance
        .collection('AddressCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await user_address.collection('address').doc(address.name).delete();
    return res;
  }
}
