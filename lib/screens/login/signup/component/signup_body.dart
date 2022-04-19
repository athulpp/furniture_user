
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:userapp/constants/material_button.dart';
import 'package:userapp/controller/bottom_bar_control.dart';

import 'package:userapp/screens/login/login_screen/login_body.dart';
import 'package:userapp/screens/login/signup/component/background_signup.dart';


class SignupBody extends StatelessWidget {
  SignupBody({Key? key}) : super(key: key);
  // final auth = FirebaseAuth.instance;
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background_signup(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SIGN UP',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assests/images/20944201.jpg',
            height: size.height * 0.35,
          ),
          Form(
              // key: _formKey,
              child: Column(
                children: [
                  TextFormContainer(
                    child: TextFormField(
                      // controller: _emailController,
                      onSaved: (Value) {
                        // _emailController.text = Value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('Please Enter Email');
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("please Enter valid email");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Your Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  TextFormContainer(
                    child: TextFormField(
                      // controller: _passwordController,
                      onSaved: (value) {
                        // _passwordController.text = value!;
                      },
                      validator: ((value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                      }),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                ],
              )),
          Container(
            width: 330,
            child: CustomButton(
              onPressed: () {
                // Get.to(() => signIn(
                //     context, _emailController.text, _passwordController.text));
              },
              text: "SignUp",
              buttonColor: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }

  // void signIn(context, String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     {
  //       try {
  //         UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //             email: email, password: password);
  //         print(userCredential.user?.uid);

  //         await storage.write(key: "uid", value: userCredential.user?.uid);

  //         Fluttertoast.showToast(msg: "Login Successful");
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => BottomNavigation()));
  //       } catch (e) {
  //         return null;
  //       }
  //     }
  //   }
  // }
}
