import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:userapp/constants/material_button.dart';

import 'package:userapp/controller/controller.dart';
import 'package:userapp/screens/login/login_screen/login..dart';

import 'package:userapp/screens/login/login_screen/login_body.dart';
import 'package:userapp/screens/login/signup/component/background_signup.dart';

class SignupBody extends StatelessWidget {
  SignupBody({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background_signup(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN UP',
              style: GoogleFonts.adventPro(
                  fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 200,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.asset('assests/images/signup.json')),
                ],
              )),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormContainer(
                    child: TextFormField(
                      style: GoogleFonts.actor(fontWeight: FontWeight.w500),
                      controller: controller.firstNameEditingController,
                      onSaved: (value) {
                        controller.firstNameEditingController.text = value!;
                      },
                      validator: ((value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter First Name");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Min. 3 Character is required");
                        }
                      }),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  TextFormContainer(
                    child: TextFormField(
                      style: GoogleFonts.actor(fontWeight: FontWeight.w500),
                      controller: controller.secondNameEditingController,
                      onSaved: (value) {
                        controller.secondNameEditingController.text = value!;
                      },
                      validator: ((value) {
                        RegExp regex = RegExp(r'^.{1,}$');
                        if (value!.isEmpty) {
                          return ("Please Enter Last name");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Min. 1 Character is required");
                        }
                      }),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  TextFormContainer(
                    child: TextFormField(
                      style: GoogleFonts.actor(fontWeight: FontWeight.w500),
                      controller: controller.emailEditingController,
                      onSaved: (value) {
                        controller.emailEditingController.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('Please Enter Email');
                        }
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.brown,
                          )),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: toggle,
                    builder: (context, value, child) {
                      return TextFormContainer(
                        child: TextFormField(
                          style: GoogleFonts.actor(fontWeight: FontWeight.w500),
                          obscureText: toggle.value,
                          controller: controller.passwordEditingController,
                          onSaved: (value) {
                            controller.passwordEditingController.text = value!;
                          },
                          validator: ((value) {
                            RegExp regex = RegExp(r'^.{6,}$');
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
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.brown,
                            ),
                            suffix: InkWell(
                              onTap: () {
                                toggle.value = !toggle.value;
                              },
                              child: Icon(toggle.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: 330,
              child: CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      controller.signUp(
                          controller.emailEditingController.text.trim(),
                          controller.passwordEditingController.text.trim());
                      controller.firstNameEditingController.clear();
                      controller.secondNameEditingController.clear();
                      controller.emailEditingController.clear();
                      controller.passwordEditingController.clear();

                      Get.to((const Login()));
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  }
                },
                text: "SignUp",
                buttonColor: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
