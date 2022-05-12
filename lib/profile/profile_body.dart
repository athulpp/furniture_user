import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:userapp/controller/controller.dart';

import 'package:userapp/screens/my_order/my_order.dart';

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
            Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assests/images/main_bottom.png',
                  width: double.infinity,
                  height: 100.0,
                )),
            Positioned(
                right: 1,
                left: 1,
                top: 20,
                child: Image.asset('assests/images/Group.png'))

            // CircleAvatar(
            //   backgroundImage: NetworkImage(
            //       'https://image.shutterstock.com/image-photo/closeup-photo-amazing-short-hairdo-260nw-1617540484.jpg'),
            // ),
            // Positioned(
            //   right: -12,
            //   bottom: 0,
            //   child: SizedBox(
            //     height: 46,
            //     width: 46,
            //     child: TextButton(
            //         onPressed: () {},
            //         child: SvgPicture.asset('assests/images/1298735.svg')),
            //   ),
            // ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'My Orders',
        press: () {
          Get.to((MyOrder()));
        },
        icon: 'assests/images/person-244.svg',
      ),
      // SizedBox(
      //   height: 20,
      // ),
      // ProfileMenu(
      //   text: 'Settings',
      //   press: () {
      //     Get.to((SettingsScreen()));
      //   },
      //   icon: 'assests/images/settings-5670.svg',
      // ),
      SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'Privacy Policy',
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
      SizedBox(
        height: 20,
      ),
      ProfileMenu(
        text: 'Log out',
        press: () {
          controller.logOut();
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        height: 100,
        width: double.infinity,
        // color: Colors.grey.shade300,
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
                  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Icon(
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
