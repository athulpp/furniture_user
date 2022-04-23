import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/controller.dart';

import 'package:userapp/profile/profile_screen.dart';
import 'package:userapp/screens/Homescreen.dart';

import 'package:userapp/screens/login/welcome/welcome_screen.dart';
import 'package:userapp/screens/orders/carts_screen.dart';

import 'package:userapp/screens/search/search_screen.dart';


import 'package:userapp/screens/wishlist/wishlist_builder.dart';

final data_control = Get.put(Controller());
class BottomNavigation extends StatelessWidget {
   BottomNavigation({
    Key? key,
  }) : super(key: key);
  List<String> title = ['Home', 'Wish List', 'Cart', 'Profile'];
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOption = [
      HomeScreen(),
      // SeachScreen(),
      WishList(),
      CartScreen(),
      // OrdersScreen(),
      ProfileScreen()
    ];
    return SafeArea(
        child: Scaffold(
   appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(() => SeachScreen());
            },
            icon: Icon(Icons.search_rounded)),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: GetBuilder<Controller>(
          id: 'indexchange',
          builder: (controller) {
            return Text(title[data_control.selectedIndex]);
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Get.to(FirstScreen());
          //     },
          //     icon: Icon(Icons.login_sharp)),
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
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: controller.onItemTapped,
                currentIndex: controller.selectedIndex,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      activeIcon: Icon(Icons.home, color: Colors.white),
                      label: ''),
      
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.grey,
                      ),
                      activeIcon:
                          Icon(Icons.bookmark_border, color: Colors.white),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                      activeIcon:
                          Icon(Icons.shopping_cart, color: Colors.white),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      activeIcon: Icon(Icons.person, color: Colors.white),
                      label: ''),
                ],
              );
            }),
      ),
    ));
  }
}
