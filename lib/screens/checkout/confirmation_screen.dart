import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen(
      {Key? key,
      required this.id,
      required this.addressName,
      required this.addressAdd,
      required this.AddressPin,
      required this.total})
      : super(key: key);

  // final controller = Get.put(ConfirmationScreenController());
  var id;
  String addressName;
  String addressAdd;
  String AddressPin;
  var total;
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;

    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("Confirmation"),
          ),
          body: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                addressCard(size, id, addressName, addressAdd, AddressPin),
                SizedBox(
                  height: size.height / 30,
                ),
                orderDetails(size),
                
              ],
            ),
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              // controller.onPay();
            },
            child: Container(
              height: size.height / 12,
              width: size.width / 1.2,
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                "Pay Now",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addressCard(Size size, id, name, address, pincode) {
    return Material(
      elevation: 5,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        width: size.width / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                address,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              pincode,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderDetails(Size size) {
    Widget text(String header, String footer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            footer,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Material(
      elevation: 5,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        width: size.width / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Price Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            text('Total Price:', 'Rs. ${total}'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: text('Delivery charge:', 'Rs.${50}'),
            ),
            text('Payable Price :', 'Rs. ${total + 50}'),
          ],
        ),
      ),
    );
  }
}
