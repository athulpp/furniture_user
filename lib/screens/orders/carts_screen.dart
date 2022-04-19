import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/model/product.dart';

import 'package:userapp/shipping%20address/address_new.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // appBar: AppBar(
      //   backgroundColor: Colors.grey.shade100,
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'My Cart',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'Add items ',
                //   style: Theme.of(context).textTheme.headline6,
                // ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.black,
                //     shape: RoundedRectangleBorder(),
                //     elevation: 0,
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/');
                //   },
                //   child: Text(
                //     "Add More Items",
                //     style: Theme.of(context)
                //         .textTheme
                //         .headline6!
                //         .copyWith(color: Colors.white),
                //   ),
                // ),
              ],
            ),
            CartProductCard(),
            // CartProductCard()
            Divider(
              thickness: 2,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    '5647',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            // Stack(
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       margin: EdgeInsets.all(5),
            //       decoration: BoxDecoration(
            //         color: Colors.black.withAlpha(50),
            //       ),
            //       height: 55,
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       margin: EdgeInsets.all(5),
            //       height: 50,
            //       decoration: BoxDecoration(
            //         color: Colors.black,
            //       ),
            //     ),
            //     // Padding(
            //     //   padding: const EdgeInsets.all(8.0),
            //     //   child: ElevatedButton(
            //     //       onPressed: () {},
            //     //       child: Text(
            //     //         'go to checkout'.toUpperCase(),
            //     //         style: Theme.of(context).textTheme.headline6,
            //     //       )),
            //     // )
            //     Padding(
            //       padding: const EdgeInsets.only(left: 70, top: 15),
            //       child: Text('Happy Shopping Come back Agian'),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Container(
          color: Colors.grey,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey.shade200),
                onPressed: () {
                  Get.to(() => DeliveryAddress());
                },
                child: Text(
                  'GO TO CHECKOUT',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.woodenstreet.com/images/furniture/deal-1.jpg?v1'))),
          //   child: Image.network(

          //     width: 100,
          //     height: 80,
          //     fit: BoxFit.cover,
          //   ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Table',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('price', style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_circle),
            ),
            Text('1'),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle),
            ),
          ],
        )
      ],
    );
  }
}
