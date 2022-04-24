import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:userapp/constants/material_button.dart';
import 'package:userapp/controller/bottom_bar_control.dart';
import 'package:userapp/screens/login/login_screen/login_background.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    Key? key,
  }) : super(key: key);
  final auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LOGIN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assests/images/—Pngtree—hand drawn cartoon furniture table_4396870.png',
            height: size.height * 0.35,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormContainer(
                  child: TextFormField(
                    controller: _emailController,
                    onSaved: (value) {
                      _emailController.text = value!;
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
                    controller: _passwordController,
                    onSaved: (value) {
                      _passwordController.text = value!;
                    },
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return "Password is required for login";
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password(Min. 6 Character)");
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.brown,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 330,
            child: CustomButton(
              onPressed: () {
                signIn(
                    context, _emailController.text, _passwordController.text);
                // Get.to(() => signIn(
                //     context, _emailController.text, _passwordController.text));
              },
              text: "Login",
              buttonColor: Colors.brown,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an Account ?",
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                  onTap: () {
                    // Get.to(() => SignUp());
                  },
                  child: Text("Sign Up"))
            ],
          ),
        ],
      ),
    );
  }

  void signIn(context, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      {
        try {
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
              email: email, password: password);
          print(userCredential.user?.uid);

          Fluttertoast.showToast(msg: "Login Successful");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavigation()));
        } catch (e) {
          return print(e);
        }
      }
    }
    // }
  }
}

class TextFormContainer extends StatelessWidget {
  final Widget child;
  const TextFormContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.brown.shade200,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
