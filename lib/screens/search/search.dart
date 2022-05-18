// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Search extends SearchDelegate {
//   final Stream<QuerySnapshot> _productStream =
//       FirebaseFirestore.instance.collection('products').snapshots();
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: _productStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             print("Something went wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text('Loading');
//           }
//           return ListView.builder(itemCount:snapshot.data!.docs.length ,itemBuilder: (context, index) {

//           });
//         });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:userapp/controller/controller.dart';

// class SearchIt extends StatelessWidget {
//   SearchIt({Key? key}) : super(key: key);
//   TextEditingController seachController = TextEditingController();
//   DocumentSnapshot? snapshot;
//   @override
//   Widget build(BuildContext context) {
//     Widget searchData() {
//       return ListView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return ListTile(
//                 title: Text(
//               snapshot![index].data()!['productname'],
//             ));
//           });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: TextFormField(
//           controller: seachController,
//         ),
//       ),
//       body: Column(
//         children: [
//           GetBuilder<Controller>(
//             init: Controller(),
//             builder: (value) {
//               return IconButton(
//                   onPressed: () {
//                     value.queryData(seachController.text).then((value) {
//                       snapshot = value;
//                     });
//                   },
//                   icon: Icon(Icons.search));
//             },
//           ),
//           searchData()
//         ],
//       ),
//     );
//   }
// }

// new search implementation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:userapp/product_overview/product_detail.dart';

class ProductSearch extends SearchDelegate {
  CollectionReference _firebaseFireStore =
      FirebaseFirestore.instance.collection('products');
  @override
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.grey, // affects AppBar's background color
        // hintColor: Colors.grey, // affects the initial 'Search' text
        textTheme: const TextTheme(
            headline6: TextStyle(
                // headline 6 affects the query text
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFireStore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            print('snapshot data here $snapshot');
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(snapshot.data);
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['productname']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String productname = data.get('productname');
                  final String image = data.get('productimage');
                  return SizedBox(
                    height: 60,
                    child: Material(
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => DetailScreen(
                                productId: data.id,
                                productName: data['productname'],
                                productDesc: data['productdes'],
                                productPrice: data['productprice'],
                                productImage: data['productimage'],
                                productQuantity: data['productquantity'],
                              ));
                        },
                        leading: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                        title: Text(productname),
                      ),
                    ),
                  );
                })
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assests/images/search.json'),
        Text(
          'Search Your Furniture',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    ));
  }
}
