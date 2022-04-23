import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:userapp/model/product.dart';
// import 'package:userapp/screens/login/login_screen.dart';
import 'package:userapp/screens/my_order/my_order.dart';
import 'package:userapp/screens/payment_method/payment_method.dart';
import 'package:userapp/screens/settings/settings.dart';
import 'package:userapp/screens/shipping_address/shipping_address.dart';

class UserProfileScreen extends StatelessWidget {
 
  const UserProfileScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assests/images/icon (2).png'),
                    radius: 50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Athul P P'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => MyOrder());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('My Orders'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => ShippingAddressScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Shipping Addresses'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => PaymentScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Payment Method'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => SettingsScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Settings'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Get.to(() => LoginScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Log out'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
