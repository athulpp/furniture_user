import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     IconButton(
          //         onPressed: () {
          //           Get.back();
          //         },
          //         icon: Icon(Icons.arrow_back_ios)),
          //     SizedBox(
          //       width: 130,
          //     ),
          //     Text(
          //       'Setting',
          //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Personal information',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                Icon(Icons.edit_attributes_outlined)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              // Get.to(() => ());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.grey,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Name'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              // Get.to(() => ());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.grey,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Email'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Help Center',
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 5,
          // ),
          // InkWell(
          //   onTap: () {
          //     // Get.to(() => ());
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20),
          //     child: Card(
          //       color: Colors.grey,
          //       shadowColor: Colors.grey,
          //       child: Container(
          //         padding: EdgeInsets.all(15),
          //         width: 400,
          //         height: 50,
          //         color: Colors.grey.shade100,
          //         child: Text('FAQ'),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 15,
          // ),
          // InkWell(
          //   onTap: () {
          //     // Get.to(() => ());
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20),
          //     child: Card(
          //       color: Colors.grey,
          //       shadowColor: Colors.grey,
          //       child: Container(
          //         padding: EdgeInsets.all(15),
          //         width: 400,
          //         height: 50,
          //         color: Colors.grey.shade100,
          //         child: Text('Contact Us'),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              // Get.to(() => ());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Card(
                color: Colors.grey,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: 400,
                  height: 50,
                  color: Colors.grey.shade100,
                  child: Text('Privacy & Terms'),
                ),
              ),
            ),
          ),
          Image.network(
            'http://www.downloadclipart.net/medium/45342-personal-details-images.png',
            width: 180,
          )
        ],
      )),
    );
  }
}
