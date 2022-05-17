import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListContent extends StatelessWidget {
  WishListContent(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.productDesc,
      required this.productPrice,
      required this.productImage,
      required this.productQuantity,
      required this.onPressed})
      : super(key: key);
  String productId;
  String productName;
  String productDesc;
  String productPrice;
  String productQuantity;
  final VoidCallback onPressed;

  String productImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.only(right: 20, bottom: 10, left: 20, top: 10),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      child: Image.network(productImage),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            productPrice,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          child: Container(
            height: 30,
            width: 30,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(0),
              color: Colors.red,
              child: Icon(Icons.clear),
              onPressed: (() {
                FirebaseFirestore.instance
                    .collection('FavCollections')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('Fav')
                    .doc(productId)
                    .delete();
              }),
            ),
          ),
        )
      ],
    );
  }
}

Widget positionedRemove() {
  return Positioned(
    top: 20,
    right: 15,
    child: Container(
      height: 30,
      width: 30,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(0),
        color: Colors.red,
        child: Icon(Icons.clear),
        onPressed: (() {}),
      ),
    ),
  );
}
