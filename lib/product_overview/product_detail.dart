import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:userapp/controller/add%20_to_fav.dart';
import 'package:userapp/controller/bottom_bar_control.dart';
import 'package:userapp/controller/cart_controller.dart';
import 'package:userapp/model/cart.dart';

import 'package:userapp/model/favorite.dart';
import 'package:userapp/product_overview/components/product_descripition.dart';

import 'package:userapp/screens/login/login_screen/login..dart';

import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  DetailScreen(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.productDesc,
      required this.productPrice,
      required this.productImage,
      required this.productQuantity})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final productId;
  String productName;
  String productDesc;
  String productPrice;
  String productQuantity;

  String productImage;
  var uuid = const Uuid();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.45),
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ProductDescripition(
                          productDesc: productDesc,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(productName,
                                  style: GoogleFonts.raleway(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Price\n',
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  TextSpan(
                                      text: '??? $productPrice',
                                      style: GoogleFonts.carme(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30))
                                ]),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 350,
                              width: 260,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.network(productImage)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height / 14,
        width: size.width,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(size, () {
                // ignore: unnecessary_null_comparison
                if (FirebaseAuth.instance.currentUser!.uid == null) {
                  Get.to(() => const Login());
                } else {
                  cartController.addToCart(Cart(
                      cartId: productId,
                      productName: productName,
                      productDes: productDesc,
                      productPrice: productPrice,
                      ProductQuantity: 1.toString(),
                      productImage: productImage));
                }

                BottomNavigation(
                  currentIndex: 2,
                ).launch(context, pageRouteAnimation: PageRouteAnimation.Fade);
              }, Colors.redAccent, "Add to Cart"),
            ),
            Expanded(
              child: CustomButton(size, () {
                if (favController.hasListeners) {}
                favController.addToFavourite(Favorite(
                    productId: productId,
                    productName: productName,
                    productImage: productImage,
                    productDes: productDesc,
                    productPrice: productPrice,
                    ProductQuantity: productQuantity));

                toast('Added to Your WishList');
              }, Colors.white, "Add to Favorite"),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown.shade200,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Get.to(BottomNavigation(
                currentIndex: 2,
              ));
            },
            icon: Icon(Icons.shopping_bag))
      ],
    );
  }

  Widget CustomButton(
      Size size, VoidCallback function, Color color, String title) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          title,
          style: GoogleFonts.actor(
              fontSize: 18,
              color: color == Colors.redAccent ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
