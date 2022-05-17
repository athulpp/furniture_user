import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:userapp/controller/controller.dart';

import 'package:userapp/profile/profile_screen.dart';
import 'package:userapp/screens/Homescreen.dart';

import 'package:userapp/screens/login/welcome/welcome_screen.dart';
import 'package:userapp/screens/orders/carts_screen.dart';
import 'package:userapp/screens/search/search.dart';

import 'package:userapp/screens/wishlist/wishlist_builder.dart';

import '../constants/const.dart';

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
        // leading: IconButton(
        //     onPressed: () {
        // Get.to(() => SeachScreen());

        // Get.to(() => ProductSearch());
        // showSearch(
        //   context: context,
        //   delegate: ProductSearch(),
        // );
        // },
        // icon: Icon(Icons.search_rounded)),
        centerTitle: true,
        backgroundColor: kthemeColor,
        title: GetBuilder<Controller>(
          id: 'indexchange',
          builder: (controller) {
            return Text(title[data_control.selectedIndex],
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
                ));
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ProductSearch());
              },
              icon: Icon(Icons.search_rounded))
          // IconButton(
          //     onPressed: () {
          //       WelcomeScreen().launch(context,
          //           pageRouteAnimation: PageRouteAnimation.Slide);
          //       // Get.to(() => WelcomeScreen());
          //     },
          //     icon: Icon(Icons.login))
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
            canvasColor: kthemeColor,
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
                      title: Text('Home',
                          style:
                              GoogleFonts.tillana(fontWeight: FontWeight.bold)),
                      activeColor: kthemeColor,
                      inactiveColor: kthemeSecColor),
                  BottomNavyBarItem(
                    icon: Icon(Icons.bookmark_border),
                    title: Text('Wishlist',
                        style:
                            GoogleFonts.tillana(fontWeight: FontWeight.bold)),
                    activeColor: kthemeColor,
                    inactiveColor: kthemeSecColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text('Cart',
                        style:
                            GoogleFonts.tillana(fontWeight: FontWeight.bold)),
                    activeColor: kthemeColor,
                    inactiveColor: kthemeSecColor,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.topic),
                    title: Text('Profile',
                        style:
                            GoogleFonts.tillana(fontWeight: FontWeight.bold)),
                    activeColor: kthemeColor,
                    inactiveColor: kthemeSecColor,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
