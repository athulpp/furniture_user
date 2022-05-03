import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:userapp/model/favorite.dart';

AddFavController favController = AddFavController();

class AddFavController extends GetxController {
  Future addToFavourite(Favorite item) async {
    String res = 'Some error occured';
    try {
      DocumentReference<Map<String, dynamic>> Favuser = FirebaseFirestore
          .instance
          .collection('FavCollections')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await Favuser.collection('Fav')
          .doc(item.productId)
          .set(item.toJson())
          .then((value) {});
      res = 'success';
    } catch (err) {
      print('...........$err');
    }
    return res;
  }
}
