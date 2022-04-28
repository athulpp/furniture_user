import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:userapp/model/product.dart';

ProductController productController = ProductController();

class ProductController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String categoryId = "";
  String categoryTitle = "";
  List<Product> itemsData = [];
  List<Product> searchResults = [];
  bool isLoading = true, isSearchLoading = false;
  bool hasModeData = true;
  var isLoading1 = false.obs;
  DocumentSnapshot? lastDocumnet;
  int documentLimit = 7;

  Future<void> getProduct() async {
    try {
      await _firestore
          .collection('products')
          .doc(categoryId)
          .collection(categoryTitle)
          .get()
          .then((value) {
        itemsData = value.docs.map((e) => Product.fromJson(e.data())).toList();

        isLoading = false;

        update();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchProducts(String query) async {
    if (query.isNotEmpty) {
      isSearchLoading = true;
      Future.delayed(Duration.zero, () {
        update();
      });

      try {
        await _firestore
            .collection('products')
            .doc(categoryId)
            .collection(categoryTitle)
            .where('productname', isGreaterThanOrEqualTo: query)
            .get()
            .then((value) {
          searchResults =
              value.docs.map((e) => Product.fromJson(e.data())).toList();

          isSearchLoading = false;

          update();
        });
      } catch (e) {
        print(e);
      }
    }
  }
}
