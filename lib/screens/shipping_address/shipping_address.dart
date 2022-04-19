import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/model/product.dart';
import 'package:userapp/screens/shipping_address/add_new_address.dart';

class ShippingAddressScreen extends StatelessWidget {

  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: 320,
                    child: Text(
                      'Shipping Address',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text('Please select the Address '),
              SizedBox(
                height: 10,
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
                    height: 100,
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Divider(
                          thickness: 1,
                        ),
                        Text('Padamugal junction Kochi,Kerala')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    height: 100,
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Divider(
                          thickness: 1,
                        ),
                        Text('Padamugal junction Kochi,Kerala')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    height: 100,
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Divider(
                          thickness: 1,
                        ),
                        Text('Padamugal junction Kochi,Kerala')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    height: 100,
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Divider(
                          thickness: 1,
                        ),
                        Text('Padamugal junction Kochi,Kerala')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    height: 100,
                    color: Colors.grey.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        Divider(
                          thickness: 1,
                        ),
                        Text('Padamugal junction Kochi,Kerala')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddAddressScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}
