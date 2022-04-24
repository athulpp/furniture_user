import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:userapp/home/chairs.dart';
import 'package:userapp/model/product.dart';
import 'package:userapp/product_overview/product_detail.dart';

import '../product_overview/product_overview.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final Stream<QuerySnapshot> _productStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'https://www.jjwood.in/images/banner4.jpg',
      'https://danubehome.in/images/Dining%20Tables/Banner_Image.jpg',
      'https://images.squarespace-cdn.com/content/v1/56f55724d210b839ae597438/1643398319711-PQV5Z2LR719CIJS8Y2XO/Squarespace+Banner-01.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdosY3fCD2NvUByYhxah7PyeZha5m3_6JW9w&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr33NPVWDaVBeVybn6Z0culR5ymddtc22p3A&usqp=CAU',
      'https://www.choicefurnituresuperstore.co.uk/img_category_banner/category_banner_1601296464Dining-Set_1601296464.jpg'
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: ,
        body: Column(children: [
          Expanded(
              child: Container(
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: _productStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print("Something went wrong");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading');
                          }
                          return GridView.builder(
                              itemCount: snapshot.data!.docs.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1 / 1.1,
                              ),
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    snapshot.data!.docs[index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => DetailScreen());
                                  },
                                  child: ChairsList(
                                    productName:
                                        documentSnapshot['productname'],
                                    productImage:
                                        documentSnapshot['productimage'],
                                    productPrice:
                                        documentSnapshot['productprice'],
                                  ),
                                );
                              });
                        }),
                  )))
        ]));
  }
}
