import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:userapp/home/chairs.dart';
import 'package:userapp/model/product.dart';
import 'package:userapp/product_overview/product_detail.dart';

import '../product_overview/product_overview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

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
          // Container(
          //     child: CarouselSlider(
          //   options: CarouselOptions(
          //     aspectRatio: 3.5,
          //     viewportFraction: 1,
          //     enlargeCenterPage: true,
          //     enableInfiniteScroll: false,
          //     initialPage: 2,
          //     autoPlay: true,
          //   ),
          //   items: imageSliders,
          // )),

          // Stack(children: [
          //   // Container(

          //   // ),
          //   Container(
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //             begin: Alignment.topRight,
          //             end: Alignment.bottomLeft,
          //             colors: [Colors.blue, Colors.red])),
          //     child: Center(
          //       child: Text(
          //         'Hello Welcome to Furniture Arena!',
          //         style: TextStyle(
          //             fontSize: 20.0,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white),
          //       ),
          //     ),
          //   )
          // ]
          //     // Container(
          //     //   height: 270,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               'https://digitalsynopsis.com/wp-content/uploads/2019/08/beautiful-illustrations-design-inspiration-38.png'))),
          // ),
          //   Positioned(
          //       top: 250,
          //       child: Container(
          //         color: Colors.red,
          //       ))
          // ],

          Expanded(
              child: Container(
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              // child: InkWell(
              //   onTap: () {
              //     Get.to(() => ProductOverView());
              //   },
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.1,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(() => DetailScreen());
                  },
                  child: ChairsList(
                    productName: 'Table',
                    productImage:
                        'https://www.woodenstreet.com/images/furniture/deal-1.jpg?v1',
                    productPrice: '100',
                  ),
                ),
              ),
            ),
          )),
        ])

        // Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         ChairsList(
        //             productName: 'lamp',
        //             productImage:
        //                 'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg',
        //             onTap: () {
        //               Navigator.of(context).pushReplacement(MaterialPageRoute(
        //                   builder: (BuildContext context) => ProductOverView()));
        //             },
        //             productPrice: '455'),
        //         ChairsList(
        //             productName: 'cheir',
        //             productImage:
        //                 'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/F6INOOMSRRL5XOOQDRPZUWPWBA.jpg',
        //             onTap: () {
        //               Navigator.of(context).pushReplacement(MaterialPageRoute(
        //                   builder: (BuildContext context) => ProductOverView()));
        //             },
        //             productPrice: '455'),
        //       ],
        //     )
        //   ],
        // ),
        );
  }
}
