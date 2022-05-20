import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletons/skeletons.dart';
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
    // timeDilation = 10.0;
    return StreamBuilder<QuerySnapshot>(
        stream: _productStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return Center(
            // child: Lottie.asset('assests/images/66405-swap.json'));

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
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 3,
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
                            style: SkeletonAvatarStyle(width: 20, height: 20)),
                        SizedBox(width: 8),
                        SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 20, height: 20)),
                        SizedBox(width: 8),
                        SkeletonAvatar(
                            style: SkeletonAvatarStyle(width: 20, height: 20)),
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
              height: 600,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assests/images/66405-swap.json'),
                ],
              )),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: GridView.builder(
                shrinkWrap: true,
                primary: true,
                itemCount: snapshot.data!.docs.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  // print("hello world${snapshot.data!.docs.isNotEmpty}");
                  // ignore: unnecessary_null_comparison
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
                      clipBehavior: Clip.hardEdge,
                      type: MaterialType.canvas,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      borderOnForeground: true,
                      borderRadius: BorderRadius.circular(5),
                      elevation: 10,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                      style: GoogleFonts.alice(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "\₹ ${documentSnapshot['productprice']}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
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
