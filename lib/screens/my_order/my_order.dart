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
            
                itemBuilder: ((context, index)

                 {
                  
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
 
                            topRight: const Radius.circular(40.0),
                          ),
           
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
         
            ) 
        );
  }
}
