import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/screens/payment_method/payment_method.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Delivery Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Where are Your ordered items shippied ?',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  cursorHeight: 20,
                  autofocus: false,
                  controller: TextEditingController(text: "Athul"),
                  decoration: InputDecoration(
                    labelText: 'Enter your Name',
                    hintText: "Enter your Name",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.keyboard),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  cursorHeight: 20,
                  autofocus: false,
                  controller: TextEditingController(text: "Kochi"),
                  decoration: InputDecoration(
                    labelText: 'Enter your Address',
                    hintText: "Enter your Address",
                    prefixIcon: Icon(Icons.place),
                    suffixIcon: Icon(Icons.keyboard),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),

            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  cursorHeight: 20,
                  autofocus: false,
                  controller: TextEditingController(text: "City"),
                  decoration: InputDecoration(
                    labelText: 'Enter your City',
                    hintText: "Enter your City",
                    prefixIcon: Icon(Icons.location_city),
                    suffixIcon: Icon(Icons.keyboard),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  cursorHeight: 20,
                  autofocus: false,
                  controller: TextEditingController(text: "District"),
                  decoration: InputDecoration(
                    labelText: 'Enter your District',
                    hintText: "Enter your District",
                    prefixIcon: Icon(Icons.house_siding_sharp),
                    suffixIcon: Icon(Icons.keyboard),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 1.5),
                    ),
                  ),
                )),
            Image.network(
                'https://hellonimbly.com/wp-content/uploads/2021/07/Social-Media_July_09_R_Takeaway-_-Delivery-1024x576.png')
            // CustomButton(
            //     text: "SAVE ADDRESS",
            //     onPressed: () {
            //       Get.to(() => BottomNavigation());
            // })
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.black)))),
        onPressed: () {
          Get.to(() => PaymentScreen());
        },
        child: Text(
          'Deliver to this Address',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
