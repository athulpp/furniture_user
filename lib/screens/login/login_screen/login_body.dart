import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:userapp/constants/material_button.dart';
import 'package:userapp/controller/bottom_bar_control.dart';
import 'package:userapp/screens/login/login_screen/login_background.dart';
import 'package:userapp/screens/login/signup/signup.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    Key? key,
  }) : super(key: key);
  final auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('LOGIN',
              style: GoogleFonts.adventPro(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.brown)),
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
                    style: GoogleFonts.allan(
                        fontSize: 18, fontWeight: FontWeight.w500),
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
                    decoration: const InputDecoration(
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
                    style: GoogleFonts.allan(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    controller: _passwordController,
                    onSaved: (value) {
                      _passwordController.text = value!;
                    },
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return "Password is required for login";
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password(Min. 6 Character)");
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
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
          SizedBox(
            width: 330,
            child: CustomButton(
              onPressed: () {
                signIn(
                    context, _emailController.text, _passwordController.text);
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
                style: GoogleFonts.bubblerOne(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUp());
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.carterOne(fontSize: 16),
                  ))
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

          Fluttertoast.showToast(msg: "Login Successful");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavigation()));
        } on FirebaseAuthException catch (error) {
          Fluttertoast.showToast(msg: error.message.toString());
        }
      }
    }
  }
}

class TextFormContainer extends StatelessWidget {
  final Widget child;
  const TextFormContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.brown.shade200,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
