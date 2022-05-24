import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:userapp/newHome.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  String cate = '';
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        children: [
          Container(
            color: Colors.grey.shade300,
            child: SingleProductWidget(),
          ),
        ],
      ),
    );
  }
}
