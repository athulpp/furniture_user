import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:userapp/controller/controller.dart';
import 'package:userapp/controller/order_control.dart';
import 'package:userapp/model/order.dart';
import 'package:userapp/model/rating.dart';
import 'package:uuid/uuid.dart';

class ProductRating extends StatelessWidget {
  ProductRating({Key? key, required this.productId}) : super(key: key);
  final productId;
  TextEditingController comments = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RatingBar.builder(
            tapOnlyMode: false,
            updateOnDrag: true,
            initialRating: 3,
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
              }
              return CircularProgressIndicator();
            },
            onRatingUpdate: (rating) {
              UpdateSelectionIntent;
              // addRating(
              //     Rating(id: productId, rate: rating, comments: comments.text,order:Order.fromMap());
            },
          ),
        ),
        TextFormField(
          controller: comments,
        ),
      ],
    );
  }

  Future<String> addRating(Rating rating) async {
    String res = 'Some error occured';
    try {
      FirebaseFirestore.instance
          .collection('products')
          .doc()

          // .collection(productId)
          // .doc()
          .collection('rating')
          .doc()
          .set(rating.toMap());

      res = 'success';
    } catch (err) {
      print('...........$err');
    }
    return res;
  }

  List<Rating> totalRating(List<QueryDocumentSnapshot<Object?>> docs) {
    List<Rating> ratingList = [];
    for (var element in docs) {
      ratingList.add(Rating.fromMap(element));
      print('$ratingList  the product lsit');
    }
    return ratingList;
  }

//   sum(List<Rating> ratingList) {
//   double totalAvg = 0.0;

//   for (var rate in ratingList) {
//     totalAvg=(rate.rate*n)/n

//     // print(cartList);

//   return totalAvg ;
// }
// }
}
