import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("My Order"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade100,
                          border: Border.all(width: 2),
                          borderRadius: new BorderRadius.only(
                            // topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(40, 40),
                          //       color: Color.fromARGB(255, 205, 125, 152)),
                          //   BoxShadow(
                          //       offset: Offset(20, 20),
                          //       color: Color.fromARGB(255, 216, 214, 196)),
                          // ],
                          // gradient: RadialGradient(
                          //   colors: [
                          //     Color.fromARGB(255, 235, 232, 206),
                          //     Color.fromARGB(255, 153, 146, 148),
                          //   ],
                          // ),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://www.woodenstreet.com/images/furniture/deal-1.jpg?v1',
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Qty: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('10',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Amount'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('₹ 3000'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Table'),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Delivered',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 5)
            // Row(
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         Get.back();
            //       },
            //       icon: Icon(Icons.arrow_back_ios),
            //     ),
            //     SizedBox(
            //       width: 130,
            //     ),
            //     Text(
            //       'My Order',
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: Container(
            //       padding: EdgeInsets.all(10),
            //       width: 420,
            //       height: 120,
            //       color: Colors.grey.shade100,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Brown Table',
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           Divider(
            //             thickness: 1,
            //           ),
            //           Row(
            //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Quantity:',
            //                 style: TextStyle(color: Colors.grey),
            //               ),
            //               Text('  3'),
            //               SizedBox(
            //                   width: 210,
            //                   child: Text(
            //                     'Total Amount: ',
            //                     style: TextStyle(color: Colors.grey),
            //                     textAlign: TextAlign.right,
            //                   )),
            //               Text(
            //                 '2000',
            //                 style: TextStyle(fontWeight: FontWeight.bold),
            //               )
            //             ],
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           SizedBox(
            //               width: double.infinity,
            //               child: Text(
            //                 'Delivered',
            //                 textAlign: TextAlign.right,
            //                 style: TextStyle(
            //                     color: Colors.green,
            //                     fontWeight: FontWeight.bold),
            //               ))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: Container(
            //       padding: EdgeInsets.all(15),
            //       width: 400,
            //       height: 120,
            //       color: Colors.grey.shade100,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Brown Table',
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           Divider(
            //             thickness: 1,
            //           ),
            //           Row(
            //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 'Quantity:',
            //                 style: TextStyle(color: Colors.grey),
            //               ),
            //               Text('  3'),
            //               SizedBox(
            //                   width: 210,
            //                   child: Text(
            //                     'Total Amount :',
            //                     style: TextStyle(color: Colors.grey),
            //                     textAlign: TextAlign.right,
            //                   )),
            //               Text(
            //                 '2000',
            //                 style: TextStyle(fontWeight: FontWeight.bold),
            //               )
            //             ],
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           SizedBox(
            //               width: double.infinity,
            //               child: Text(
            //                 'Delivered',
            //                 textAlign: TextAlign.right,
            //                 style: TextStyle(
            //                     color: Colors.green,
            //                     fontWeight: FontWeight.bold),
            //               ))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            ) // ),
        );
  }
}
