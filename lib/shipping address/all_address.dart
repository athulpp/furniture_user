import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:userapp/controller/address-controller.dart';
import 'package:userapp/model/address.dart';
import 'package:userapp/model/cart.dart';
import 'package:userapp/screens/checkout/confirmation_screen.dart';
import 'package:userapp/shipping%20address/address.dart';

class AllAddressScreen extends StatelessWidget {
  AllAddressScreen({Key? key, required this.total, required this.cartList})
      : super(key: key);
  final _addressStream = FirebaseFirestore.instance
      .collection('AddressCollection')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('address')
      .snapshots();
  var total;
  List<Cart> cartList;
  // final cartId;
  // String Cartname;
  // String CartDes;
  // String CartQuantity;
  // String CartPrice;

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Address'),
      ),
      body: StreamBuilder(
        stream: _addressStream,
        builder:
            ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          if (snapshot.data!.docs.isEmpty) {
            return SizedBox(
              height: 600,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assests/images/lf30_editor_itvwrc9z.json'),
                  Text('No Items')
                ],
              )),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      // print(documentSnapshot.id);
                      // Get.to(() => ConfirmationScreen(
                      //       total: total,
                      //       id: documentSnapshot.id,
                      //       addressName: documentSnapshot['name'],
                      //       addressAdd: documentSnapshot['address'],
                      //       AddressPin: documentSnapshot['pincode'],
                      //       phoneNo: documentSnapshot['phoneNumber'],
                      //       cartList: cartList,
                      //     ));

                      ConfirmationScreen(
                        total: total,
                        id: documentSnapshot.id,
                        addressName: documentSnapshot['name'],
                        addressAdd: documentSnapshot['address'],
                        AddressPin: documentSnapshot['pincode'],
                        phoneNo: documentSnapshot['phoneNumber'],
                        cartList: cartList,
                      ).launch(context,
                          pageRouteAnimation: PageRouteAnimation.Fade);
                    },
                    child: Material(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
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
                                  TextIcon(
                                    text: 'Address : ',
                                    suffix: Text(
                                      documentSnapshot['address'],
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ), // Optional
                                  ),
                                  TextIcon(
                                    text: 'Pin Code: ',
                                    suffix: Text(
                                      documentSnapshot['pincode'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ), // Optional
                                  ),
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  // Text(
                                  //   documentSnapshot['phoneNumber'],
                                  //   style: TextStyle(
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.w500),
                                  // ),
                                  // SizedBox(
                                  //   height: size.height * 0.02,
                                  // ),
                                  TextIcon(
                                    text: 'Mobile No: ',
                                    suffix: Text(
                                      documentSnapshot['phoneNumber'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ), // Optional
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to((EditAddress(
                                          id: documentSnapshot.id,
                                          name: documentSnapshot['name'],
                                          address: documentSnapshot['address'],
                                          pincode: documentSnapshot['pincode'],
                                          phoneNumber:
                                              documentSnapshot['phoneNumber'],
                                        )));
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
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(() => AddAdressScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
