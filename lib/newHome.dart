import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/product_overview/product_detail.dart';

class SingleProductWidget extends StatefulWidget {
  // final String productImage;
  // final String productName;
  // final String productModel;
  // final String productPrice;

  // final VoidCallback onPressed;
  // SingleProductWidget({
  // required this.productImage,
  // required this.productName,
  // required this.productModel,
  // required this.productPrice,
  // required this.onPressed,
  // });

  @override
  _SingleProductWidgetState createState() => _SingleProductWidgetState();
}

final Stream<QuerySnapshot> _productStream =
    FirebaseFirestore.instance.collection('products').snapshots();

class _SingleProductWidgetState extends State<SingleProductWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _productStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
                shrinkWrap: true,
                primary: true,
                itemCount: snapshot.data!.docs.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return GestureDetector(
                    // onTap:Widget.() {,
                    onTap: () {
                      Get.to(DetailScreen(
                          productId: documentSnapshot.id,
                          productName: documentSnapshot['productname'],
                          productDesc: documentSnapshot['productdes'],
                          productPrice: documentSnapshot['productprice'],
                          productImage: documentSnapshot['productimage'],
                          productQuantity:
                              documentSnapshot['productquantity']));
                    },
                    // },

                    child: Material(
                      elevation: 5,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      scale: 2,
                                      image: NetworkImage(
                                        documentSnapshot['productimage'],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      documentSnapshot['productname'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Text(
                                  //   widget.productModel,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextStyle(color: Colors.black),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "\₹ ${documentSnapshot['productprice']}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
