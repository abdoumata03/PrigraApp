import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prigra_app/screens/profile_screen.dart';
import 'package:prigra_app/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navigation_bar/bottom_navigation_controller.dart';
import '../bottom_navigation_bar/model_bottom_navigation_bar.dart';
import '../constants.dart';
import '../controllers/home_controller.dart';
import '../size_config.dart';
import 'annonces_page.dart';
import 'first_page.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
        init: BottomNavController(),
    builder: (controller) =>
    Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: controller.bottmIndex,
        onItemSelected: (index) {
          controller.changeIndex(index);
        },
        items: [
          BottomNavyBarItem(
              activeColor: kPrimaryColor,
              icon: controller.bottmIndex == 0
                  ? SvgPicture.asset("assets/icons/Home_white.svg")
                  : SvgPicture.asset("assets/icons/home.svg"),
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(16),
                ),
              )),
          BottomNavyBarItem(
              activeColor: kPrimaryColor,
              icon: controller.bottmIndex == 1
                  ? SvgPicture.asset("assets/icons/News_white.svg")
                  : SvgPicture.asset("assets/icons/News.svg"),
              title: Text(
                "Annonces",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(13.5),
                ),
              )),
          BottomNavyBarItem(
              activeColor: kPrimaryColor,
              icon: controller.bottmIndex == 2
                  ? SvgPicture.asset("assets/icons/Person.svg")
                  : SvgPicture.asset("assets/icons/Person.svg"),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: getHeight(16),
                ),
              )),
        ],


      ),
        body: IndexedStack(
          index: controller.bottmIndex,
          children: [
            SlideAnimation3(),
            AnnonesPage(),
            ProfilScreen(),

          ],
        ),

    ));
  }


}
