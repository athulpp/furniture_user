import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/bottom_bar_control.dart';
import 'package:userapp/controller/controller.dart';
import 'package:userapp/product_overview/product_detail.dart';

class SeachScreen extends StatelessWidget {
  SeachScreen({Key? key}) : super(key: key);
  TextEditingController searchcontroller = TextEditingController();
  final Stream<QuerySnapshot> _productStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffcdc1c1),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Search',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GetBuilder<Controller>(
                    id: 'search',
                    init: Controller(),
                    builder: (textControl) {
                      return TextFormField(
                        onChanged: ((value) {
                          textControl.searchProducts(value);
                          textControl.update();
                        }),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Enter product name'),
                      );
                    },
                  ),
                ),
                GetBuilder<Controller>(
                    init: Controller(),
                    id: 'search',
                    builder: (searchControl) {
                      if (searchControl.searchResults.isEmpty) {
                        print("Something went wrong");

                        return Container();
                      }
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Text('Loading');
                      // }

                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchControl.searchResults.length,
                          itemBuilder: (context, index) {
                            final data = searchControl.searchResults[index];

                            return ListTile(
                              onTap: (() {}),
                              title: Text(data['productname']),
                            );
                          });
                    })
              ],
            ),
          ),
        ));
  }
}
