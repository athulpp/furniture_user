import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:userapp/controller/controller.dart';
import 'package:userapp/home/home.dart';

import 'package:userapp/profile/profile_screen.dart';
import 'package:userapp/screens/Homescreen.dart';

import 'package:userapp/screens/login/welcome/welcome_screen.dart';
import 'package:userapp/screens/orders/carts_screen.dart';
import 'package:userapp/screens/search/search.dart';

import 'package:userapp/screens/search/search_screen.dart';

import 'package:userapp/screens/wishlist/wishlist_builder.dart';

final data_control = Get.put(Controller());

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    this.currentIndex,
    Key? key,
  }) : super(key: key);

  int? currentIndex;
  List<String> title = ['Home', 'Wish List', 'Cart', 'Profile'];
  init() {
    print("current Index");
    if (currentIndex != null) {
      data_control.selectedIndex = currentIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();

    List<Widget> _widgetOption = [
      HomeScreen(),
      // HomeScreens(),
      // SeachScreen(),
      WishList(),
      CartScreen(),
      // OrdersScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Get.to(() => SeachScreen());

              // Get.to(() => ProductSearch());
              showSearch(
                context: context,
                delegate: ProductSearch(),
              );
            },
            icon: Icon(Icons.search_rounded)),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: GetBuilder<Controller>(
          id: 'indexchange',
          builder: (controller) {
            return Text(title[data_control.selectedIndex],
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.brown, letterSpacing: .5),
                ));
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => WelcomeScreen());
              },
              icon: Icon(Icons.login))
        ],
      ),
      body: GetBuilder<Controller>(
          init: Controller(),
          id: 'indexchange',
          builder: (controller) {
            return _widgetOption[controller.selectedIndex];
          }),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: GetBuilder<Controller>(
            id: 'indexchange',
            builder: (controller) {
              return BottomNavyBar(
                showElevation: true,
                onItemSelected: controller.onItemTapped,
                selectedIndex: controller.selectedIndex,
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    activeColor: Colors.black,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.bookmark_border),
                    title: Text('Wishlist'),
                    activeColor: Colors.black,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text('Cart'),
                    activeColor: Colors.black,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.bookmark_border),
                    title: Text('Profile'),
                    activeColor: Colors.black,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
