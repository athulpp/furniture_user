import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:userapp/controller/controller.dart';

import 'package:userapp/screens/my_order/my_order.dart';
import 'package:userapp/screens/settings/faq.dart';
import 'package:userapp/screens/settings/settings.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 150,
        width: 150,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              right: 1,
              left: 1,
              top: 20,
              child: Image.asset(
                'assests/images/Group.png',
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'My  Orders',
        press: () {
          // Get.to((MyOrder()));
          MyOrder()
              .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
        },
        icon: 'assests/images/person-244.svg',
      ),
      const SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'Settings',
        press: () {
          Get.to((SettingsScreen()));
        },
        icon: 'assests/images/settings-5670.svg',
      ),
      const SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'Privacy  Policy',
        press: () {
          showAboutDialog(
              applicationIcon: Image.asset(
                'assests/images/Group.png',
                width: 70,
                height: 70,
              ),
              context: context,
              applicationName: 'Furnidesk',
              applicationVersion: '1.1.0',
              children: [
                const Text(
                    "Furnidesk is a Tables Ecommerce Platform Created by Athul"),
              ]);
        },
        icon: 'assests/images/user-security-11931.svg',
      ),
      const SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'FAQ',
        press: () {
          Get.to(() => const Faq());
        },
        icon: 'assests/images/sign-out-3298.svg',
      ),
      const SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'Log out',
        press: () {
          AwesomeDialog(
            context: context,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Logout',
            desc: 'Do you want to Logout???',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              controller.logOut();
            },
          ).show();
        },
        icon: 'assests/images/sign-out-3298.svg',
      )
    ]);
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {Key? key, required this.text, required this.press, required this.icon})
      : super(key: key);
  final String text;
  final VoidCallback press;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200),
        height: 60,
        width: double.infinity,
     
        child: Material(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          child: TextButton(
              clipBehavior: Clip.antiAlias,
              onPressed: press,
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 32,
                  ),
                const  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: GoogleFonts.arvo(
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent,
                          fontSize: 18),
                    ),
                  ),
                const  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.brown,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
