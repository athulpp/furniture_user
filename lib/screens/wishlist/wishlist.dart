import 'package:flutter/material.dart';

class WishListContent extends StatelessWidget {
  const WishListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   // backgroundColor: Color(0xffcdc1c1),
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     title: Text(
    //       'Wish List',
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     centerTitle: true,
    //     elevation: 0,
    //   ),
    //   body: ListView.separated(
    //       separatorBuilder: (context, index) {
    //         return SizedBox(
    //           height: 10,
    //         );
    //       },
    //       itemCount: 10,
    //       itemBuilder: (BuildContext, context) {
    //         return Container(
    //             height: 140,
    //             width: 220,
    //             child: Card(
    //                 child: Stack(
    //               children: [
    //                 SizedBox(height: 10),
    //                 Container(
    //                   width: double.infinity,
    //                   height: 100,
    //                   margin: EdgeInsets.only(
    //                       right: 10, bottom: 10, left: 10, top: 10),
    //                   child: Material(
    //                     color: Colors.grey.shade300,
    //                     borderRadius: BorderRadius.circular(5),
    //                     elevation: 3,
    //                     child: InkWell(
    //                       onTap: () {},
    //                       child: Container(
    //                         padding: EdgeInsets.all(16),
    //                         child: Row(
    //                           children: [
    //                             Container(
    //                               height: 80,
    //                               child: Image.network(
    //                                   'https://digitalsynopsis.com/wp-content/uploads/2019/08/beautiful-illustrations-design-inspiration-38.png'),
    //                             ),
    //                             SizedBox(
    //                               width: 10,
    //                             ),
    //                             Expanded(
    //                               child: Column(
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   Text(
    //                                     'title',
    //                                     style: TextStyle(
    //                                         fontSize: 16,
    //                                         fontWeight: FontWeight.bold),
    //                                   ),
    //                                   SizedBox(
    //                                     height: 10,
    //                                   ),
    //                                   Text(
    //                                     '245',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         fontSize: 18),
    //                                   )
    //                                 ],
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             )));
    //       }),
    // );

    return Stack(
      children: [
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.only(right: 20, bottom: 10, left: 20, top: 10),
          child: Material(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
            elevation: 3,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      child: Image.network(
                          'https://digitalsynopsis.com/wp-content/uploads/2019/08/beautiful-illustrations-design-inspiration-38.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'title',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '245',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove()
      ],
    );
  }
}

Widget positionedRemove() {
  return Positioned(
    top: 20,
    right: 15,
    child: Container(
      height: 30,
      width: 30,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(0),
        color: Colors.red,
        child: Icon(Icons.clear),
        onPressed: (() {}),
      ),
    ),
  );
}
