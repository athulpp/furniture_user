import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:userapp/constants/const.dart';
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

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Address'),
      ),
      body: StreamBuilder(
        stream: _addressStream,
        builder:
            ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            const SizedBox();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          if (snapshot.data!.docs.isEmpty) {
            return SizedBox(
              height: 600,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 600,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(
                                'assests/images/lf30_editor_itvwrc9z.json')),
                        Text(
                          'Add Address',
                          style: GoogleFonts.bungee(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: const Color.fromARGB(255, 64, 40, 31)),
                        ),
                      ],
                    )),
                  ),
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
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      ConfirmationScreen(
                        total: total,
                        id: documentSnapshot.id,
                        addressName: documentSnapshot['name'],
                        addressAdd: documentSnapshot['address'],
                        AddressPin: documentSnapshot['pincode'],
                        phoneNo: documentSnapshot['phoneNumber'],
                        cartList: cartList,
                      ).launch(context,
                          pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      borderOnForeground: true,
                      color: Colors.grey.shade300,
                      shadowColor: Colors.brown,
                      type: MaterialType.button,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        documentSnapshot['name'],
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  TextIcon(
                                    text: 'Address : ',
                                    suffix: Text(
                                      documentSnapshot['address'],
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ), // Optional
                                  ),
                                  TextIcon(
                                    text: 'Pin Code: ',
                                    suffix: Text(
                                      documentSnapshot['pincode'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ), // Optional
                                  ),
                                  TextIcon(
                                    text: 'Mobile No: ',
                                    suffix: Text(
                                      documentSnapshot['phoneNumber'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ), // Optional
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to((EditAddress(
                                            id: documentSnapshot.id,
                                            name: documentSnapshot['name'],
                                            address:
                                                documentSnapshot['address'],
                                            pincode:
                                                documentSnapshot['pincode'],
                                            phoneNumber:
                                                documentSnapshot['phoneNumber'],
                                          )));
                                        },
                                        child: Container(
                                          height: size.height / 18,
                                          width: size.width * 0.4,
                                          color: Colors.green,
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
                                      const Spacer(),
                                      HoverWidget(
                                          builder: (context, bool isHovering) {
                                        return Container(
                                          height: size.height / 18,
                                          width: size.width * 0.4,
                                          child: AppButton(
                                            textColor: Colors.white,
                                            color: Colors.red,
                                            text: "Delete",
                                            onTap: () {
                                              showConfirmDialogCustom(
                                                context,
                                                title:
                                                    "Do You Want to Delete this Address?",
                                                dialogType: DialogType.DELETE,
                                                onAccept: (context) {
                                                  addressControl.deleteAddress(
                                                    Address(
                                                        name: documentSnapshot[
                                                            'name']),
                                                  );
                                                  snackBar(context,
                                                      title: 'Deleted');
                                                },
                                              );
                                            },
                                          ),
                                          color: isHovering
                                              ? Colors.red
                                              : Colors.black,
                                        );
                                      }),
                                    ],
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kthemeColor,
        onPressed: () {
          Get.to(() => AddAdressScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
