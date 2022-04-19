import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/product_overview/product_overview.dart';

import '../../constants/material_button.dart';
import '../checkout/checkout.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: CustomButton(
          buttonColor: Colors.black,
          onPressed: () {
            Get.to(() => CheckOutScreen());
          },
          text: 'Checkout',
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 100,
                padding: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: ListTile(
                  onTap: () {
                    Get.to(() => ProductOverView());
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  leading: Image.network(
                    'https://m.media-amazon.com/images/I/71+xw4gRDDL._SX569_.jpg',
                    scale: 1,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tables'),
                      Text('Price'),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove),
                  ),
                ),
              ),
            );
          }),
          separatorBuilder: (BuildContext context, int index) => const Divider(
                thickness: 5,
              ),
          itemCount: 5),
    );
  }
}
