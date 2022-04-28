import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/constants/material_button.dart';
import 'package:userapp/controller/bottom_bar_control.dart';
import 'package:userapp/product_overview/components/product_descripition.dart';
import 'package:userapp/product_overview/components/product_with_iamge.dart';
import 'package:userapp/product_overview/product_rating.dart';
import 'package:userapp/screens/orders/carts_screen.dart';
import 'package:userapp/screens/orders/orders.dart';
import 'package:userapp/screens/wishlist/wishlist_builder.dart';
// import 'package:userapp/model/product.dart';
// import 'package:userapp/product_overview/components/body.dart';
// import 'package:userapp/product_overview/components/product_with_iamge.dart';
// import 'package:userapp/product_overview/product_rating.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.productDesc,
      required this.productPrice,
      required this.productImage})
      : super(key: key);
  final productId;
  String productName;
  String productDesc;
  String productPrice;

  String productImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: buildAppBar(context),
      // body: Body(productId:productId,productName: productName,productDesc: productDesc,productPrice: productPrice,productImage: productImage,

      // ),
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
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ProductRating(),
                        ProductDescripition(
                          productDesc: productDesc,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 20, left: 20, right: 20),
                        //   child: Text(
                        //     productDesc,
                        //     style: TextStyle(height: 1.5, fontSize: 16),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10, right: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        // CartCounter(),
                        //       IconButton(
                        //           onPressed: () {},
                        //           icon: Icon(
                        //             Icons.bookmark_border,
                        //             size: 40,
                        //           ))
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        // CustomButton(
                        //   buttonColor: Colors.brown,
                        //   text: 'Add to cart'.toUpperCase(),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                  // ProductWithImage()
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Column(
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(text: 'Price\n'),
                                TextSpan(
                                    text: productPrice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                              ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 250,
                              width: 250,
                              child: Image.network(productImage),
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
      bottomSheet: CustomButton(
        buttonColor: Colors.brown,
        text: 'Add to cart'.toUpperCase(),
        onPressed: () {
          Navigator(
            onGenerateRoute: (settings) {
              Widget page = BottomNavigation();
              if (settings.name == 'CartScreen') page = CartScreen();
              return MaterialPageRoute(builder: (_) => page);
            },
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))
      ],
    );
  }
}
