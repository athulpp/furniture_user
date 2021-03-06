import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:status_alert/status_alert.dart';
import 'package:userapp/constants/material_button.dart';

import 'package:userapp/controller/user_controller.dart';
import 'package:userapp/model/usermodel.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: FutureBuilder<UserModel>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Loading'));
            }
            if (snapshot.data == null) {
              return const Text('No data');
            }

            firstNameController.text = snapshot.data!.name.toString();
            lastnameController.text = snapshot.data!.lastName.toString();
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal information',
                          style: GoogleFonts.adventPro(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.grey.shade100,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Form(
                                          child: Column(
                                        children: [
                                          AppTextField(
                                            controller:
                                                firstNameController, // Optional
                                            textFieldType: TextFieldType.NAME,
                                            decoration: const InputDecoration(
                                                labelText: 'First Name',
                                                border: OutlineInputBorder()),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          AppTextField(
                                            controller:
                                                lastnameController, // Optional
                                            textFieldType: TextFieldType.NAME,
                                            decoration: const InputDecoration(
                                                labelText: 'Last Name',
                                                border: OutlineInputBorder()),
                                          ),
                                          CustomButton(
                                            onPressed: () {
                                              updateUser();
                                            },
                                            text: 'Save',
                                            buttonColor: Colors.green,
                                          )
                                        ],
                                      )),
                                    );
                                  });
                            },
                            icon: const Icon(Icons.edit))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.grey,
                      shadowColor: Colors.grey,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 400,
                        height: 80,
                        color: Colors.grey.shade100,
                        child: Text(
                          'Name : ${snapshot.data!.name.toString()}',
                          style: GoogleFonts.alata(
                              fontSize: 26, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.grey,
                      shadowColor: Colors.grey,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 400,
                        height: 80,
                        color: Colors.grey.shade100,
                        child: Text(
                          'Last name : ${snapshot.data!.lastName.toString()}',
                          style: GoogleFonts.alata(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Card(
                      color: Colors.grey,
                      shadowColor: Colors.grey,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 400,
                        height: 80,
                        color: Colors.grey.shade100,
                        child: Center(
                          child: Text(
                            'EmailId : ${snapshot.data!.emailId.toString()}',
                            style: GoogleFonts.alata(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      StatusAlert.show(
                        context,
                        duration: const Duration(seconds: 5),
                        title: 'About',
                        subtitle:
                            'We top Tables Seller in the Online. We are selling high quality tables which trusted by millions of customers',
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Card(
                        color: Colors.grey,
                        shadowColor: Colors.grey,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          width: 400,
                          height: 80,
                          color: Colors.grey.shade100,
                          child: Text(
                            'About us',
                            style: GoogleFonts.alata(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
          }),
    );
  }

  updateUser() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    userModel.name = firstNameController.text;
    userModel.lastName = lastnameController.text;
    userModel.uid = user!.uid;
    userModel.emailId = user.email;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .update(userModel.toMap());

    Fluttertoast.showToast(msg: "User Name Changed Sucessfully");
  }
}
