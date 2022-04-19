import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/model/product.dart';

import '../../constants/const.dart';
import '../../constants/material_button.dart';
import '../sucess/sucees_page.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeightSize,
            // Row(
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         Get.back();
            //       },
            //       icon: const Icon(Icons.arrow_back_ios),
            //     ),
            //     const SizedBox(
            //       width: 320,
            //       child: Text(
            //         "Checkout",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ],
            // ),
            HeightSize,
            InkWell(
              onTap: () {
                // Get.to(() => LoginScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  color: Colors.grey.shade300,
                  shadowColor: Colors.grey,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: 400,
                    height: 100,
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Athul',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Text('Kubz padamugal junction kochi,eranakulam,kerala'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // HeightSize,
            // InkWell(
            //   onTap: () {
            //     // Get.to(() => LoginScreen());
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: Container(
            //       padding: EdgeInsets.all(15),
            //       width: 400,
            //       height: 50,
            //       color: Colors.grey.shade100,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Payment Method'),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            HeightSize,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.grey.shade300,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 100,
                  color: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order:',
                              style: TextStyle(),
                            ),
                            Text('Delivery:'),
                            Text('Total'),
                          ],
                        ),
                        trailing: Column(
                          children: [Text('5000'), Text('100'), Text('5500')],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            HeightSize,
            CustomButton(
              buttonColor: Colors.black,
              onPressed: () {
                Get.to(() => SucessScreen());
              },
              text: 'SUBMIT ORDER',
            )
          ],
        ),
      ),
    );
  }
}
