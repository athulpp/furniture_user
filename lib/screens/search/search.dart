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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/controller.dart';

class SearchIt extends StatelessWidget {
  SearchIt({Key? key}) : super(key: key);
  TextEditingController seachController = TextEditingController();
  DocumentSnapshot? snapshot;
  @override
  Widget build(BuildContext context) {
    Widget searchData() {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(
              snapshot![index].data()!['productname'],
            ));
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: seachController,
        ),
      ),
      body: Column(
        children: [
          GetBuilder<Controller>(
            init: Controller(),
            builder: (value) {
              return IconButton(
                  onPressed: () {
                    value.queryData(seachController.text).then((value) {
                      snapshot = value;
                    });
                  },
                  icon: Icon(Icons.search));
            },
          ),
          searchData()
        ],
      ),
    );
  }
}
