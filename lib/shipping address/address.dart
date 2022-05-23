import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/address-controller.dart';
import 'package:userapp/controller/controller.dart';
import 'package:userapp/model/address.dart';
import 'package:userapp/screens/checkout/confirmation_screen.dart';
import 'package:userapp/shipping%20address/address_controller.dart';
import 'package:userapp/shipping%20address/all_address.dart';
import 'package:uuid/uuid.dart';

// import 'package:userapp/constants/const.dart';
var address_id = Uuid();

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);
  bool isAddingAddress = true;

  @override
  Widget build(BuildContext context) {
    if (isAddingAddress) {
      return AddAdressScreen();
    } else {
      return EditAddressScreen();
    }
  }
}

class AddAdressScreen extends StatelessWidget {
  AddAdressScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Address"),
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         Get.to(() => AllAddressScreen());
            //       },
            //       icon: Icon(Icons.login))
            // ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: SizedBox(
                height: size.height / 10,
                width: size.width / 1.1,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 30,
                      ),
                      SizedBox(
                        // height: size.height / 5,
                        width: size.width / 1.1,
                        child: TextFormField(
                          onSaved: (value) {
                            addressControl.nameController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            }
                          },
                          // controller: controller.nameController,

                          controller: addressControl.nameController,
                          maxLength: 15,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      SizedBox(
                        height: size.height / 5,
                        width: size.width / 1.1,
                        child: TextFormField(
                          onSaved: (value) {
                            addressControl.addressController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter the Address';
                            }
                          },
                          // controller: controller.addressController,
                          controller: addressControl.addressController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      SizedBox(
                        height: size.height / 10,
                        width: size.width / 1.1,
                        child: TextFormField(
                          onSaved: (value) {
                            addressControl.pincodeController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter the Pincode";
                            }
                          },
                          keyboardType: TextInputType.number,
                          // controller: controller.pincodeController,
                          controller: addressControl.pincodeController,
                          maxLength: 6,
                          decoration: InputDecoration(
                            hintText: "Pincode",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      SizedBox(
                        height: size.height / 10,
                        width: size.width / 1.1,
                        child: TextFormField(
                          onSaved: (value) {
                            addressControl.phoneController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter the phoneNumber";
                            }
                          },
                          keyboardType: TextInputType.phone,
                          // controller: controller.pincodeController,
                          controller: addressControl.phoneController,
                          maxLength: 10,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              // controller.onTap();
              if (_formKey.currentState!.validate()) {
                {
                  try {
                    addressControl.addAddress(
                      Address(
                          // id: address_id.v4(),
                          name: addressControl.nameController.text,
                          address: addressControl.addressController.text,
                          pincode: addressControl.pincodeController.text,
                          PhoneNumber: addressControl.phoneController.text),
                    );
                    Fluttertoast.showToast(msg: "Address Added Sucessfully");
                    addressControl.nameController.clear();
                    addressControl.addressController.clear();
                    addressControl.pincodeController.clear();
                    addressControl.phoneController.clear();
                  } catch (e) {
                    print(e);
                  }
                }
              }
            },
            child: Container(
              height: size.height / 12,
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({Key? key}) : super(key: key);
  final _addressStream = FirebaseFirestore.instance
      .collection('AddressCollection')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('address')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final size = Get.size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("All Address"),
        actions: [
          IconButton(
              onPressed: () {
                // Get.to(() => AllAddressScreen());
              },
              icon: Icon(Icons.new_label))
        ],
      ),
      body: ListView(
        //  mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(
          //   height: size.height / 30,
          // ),
          StreamBuilder<QuerySnapshot>(
              stream: _addressStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print("Something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 15,
                              ),
                              width: size.width / 1.1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        documentSnapshot['name'],
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            addressControl.deleteAddress(
                                              Address(
                                                  name:
                                                      documentSnapshot['name']),
                                            );
                                          },
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      documentSnapshot['address'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    documentSnapshot['phoneNumber'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: size.height / 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // controller.onEdit();
                                      // addressScreenController.onEdit();
                                      Get.to(() => EditAddress(
                                            id: documentSnapshot.id,
                                            name: documentSnapshot['name'],
                                            address:
                                                documentSnapshot['address'],
                                            pincode:
                                                documentSnapshot['pincode'],
                                            phoneNumber:
                                                documentSnapshot['phoneNumber'],
                                          ));
                                    },
                                    child: Container(
                                      height: size.height / 18,
                                      width: size.width / 1.2,
                                      color: Colors.black,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              })
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Get.to(() => ConfirmationScreen());
        },
        child: Container(
          height: size.height / 12,
          width: size.width / 1.2,
          color: Colors.black,
          alignment: Alignment.center,
          child: const Text(
            "Proceed",
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // Widget addressCard(Size size) {
  //   return
  // }

}

class EditAddress extends StatelessWidget {
  EditAddress(
      {Key? key,
      required this.id,
      required this.name,
      required this.address,
      required this.pincode,
      required this.phoneNumber})
      : super(key: key);

  final id;
  String name;
  String address;
  String pincode;
  String phoneNumber;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  addressEdit() {
    nameController.text = name;
    addressController.text = address;
    pincodeController.text = pincode;
    phoneNumberController.text = phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    if (name != null) {
      addressEdit();
    }
    final size = Get.size;
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Edit Address"),
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         Get.to(() => EditAddressScreen());
            //       },
            //       icon: Icon(Icons.login))
            // ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 30,
                  ),
                  SizedBox(
                    height: size.height / 10,
                    width: size.width / 1.1,
                    child: TextField(
                      // controller: controller.nameController,

                      // controller: addressControl.nameController,
                      controller: nameController,
                      maxLength: 15,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  SizedBox(
                    height: size.height / 5,
                    width: size.width / 1.1,
                    child: TextField(
                      // controller: controller.addressController,
                      // controller: addressControl.addressController,
                      controller: addressController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  SizedBox(
                    height: size.height / 10,
                    width: size.width / 1.1,
                    child: TextField(
                      controller: pincodeController,
                      maxLength: 6,
                      decoration: InputDecoration(
                        hintText: "Pincode",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  SizedBox(
                    height: size.height / 10,
                    width: size.width / 1.1,
                    child: TextField(
                      controller: phoneNumberController,
                      maxLength: 10,
                      decoration: InputDecoration(
                        hintText: "PhoneNumber",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              // controller.onTap();
              addressControl.updateAddress(
                Address(
                    name: nameController.text,
                    address: addressController.text,
                    pincode: pincodeController.text,
                    PhoneNumber: phoneNumberController.text),
              );
              Fluttertoast.showToast(msg: "Address Updated Sucessfully");
              nameController.clear();
              addressController.clear();
              pincodeController.clear();
              phoneNumberController.clear();
            },
            child: Container(
              height: size.height / 12,
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
