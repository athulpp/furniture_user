import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletons/skeletons.dart';
import 'package:userapp/product_overview/product_detail.dart';
import 'package:userapp/screens/wishlist/wishlist.dart';

class WishList extends StatelessWidget {
  WishList({Key? key}) : super(key: key);
  final _favStream = FirebaseFirestore.instance
      .collection('FavCollections')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Fav')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder<QuerySnapshot>(
          stream: _favStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // return Center(child: Image.asset('assests/images/Group.png'));
              return SkeletonItem(
                  child: Column(
                children: [
                  Row(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            shape: BoxShape.circle, width: 50, height: 50),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 3,
                              spacing: 6,
                              lineStyle: SkeletonLineStyle(
                                randomLength: true,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                                minLength:
                                    MediaQuery.of(context).size.width / 6,
                                maxLength:
                                    MediaQuery.of(context).size.width / 3,
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 3,
                        spacing: 6,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 10,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 2,
                        )),
                  ),
                  SizedBox(height: 12),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      minHeight: MediaQuery.of(context).size.height / 8,
                      maxHeight: MediaQuery.of(context).size.height / 3,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 20, height: 20)),
                          SizedBox(width: 8),
                          SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 20, height: 20)),
                          SizedBox(width: 8),
                          SkeletonAvatar(
                              style:
                                  SkeletonAvatarStyle(width: 20, height: 20)),
                        ],
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 16,
                            width: 64,
                            borderRadius: BorderRadius.circular(8)),
                      )
                    ],
                  )
                ],
              ));
            }
            if (snapshot.data!.docs.isEmpty) {
              return SizedBox(
                width: 400,
                height: 600,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assests/images/66405-swap.json',
                        fit: BoxFit.cover),
                    Text(
                      'No Items',
                      style: GoogleFonts.bungee(
                          fontSize: 28,
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 64, 40, 31)),
                    )
                  ],
                )),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return WishListContent(
                  onPressed: () {
                    print('working');
                    Get.to(() => DetailScreen(
                        productId: documentSnapshot.id,
                        productName: documentSnapshot['name'],
                        productDesc: documentSnapshot['des'],
                        productPrice: documentSnapshot['price'],
                        productImage: documentSnapshot['image'],
                        productQuantity: documentSnapshot['quantity']));
                  },
                  productId: documentSnapshot.id,
                  productName: documentSnapshot['name'],
                  productDesc: documentSnapshot['des'],
                  productPrice: documentSnapshot['price'],
                  productImage: documentSnapshot['image'],
                  productQuantity: documentSnapshot['quantity'],
                );
              }),
            );
          }),
    );
  }

  // Widget positionedRemove() {
  //   return
  // }
}
