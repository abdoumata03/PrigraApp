import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prigra_app/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: IconButton(onPressed: () async {

           SharedPreferences prefs = await SharedPreferences.getInstance();
           prefs.setBool('isLoggedIn', false);
           Get.to(SigninScreen());
         }, icon:SvgPicture.asset('assets/illustrations/logo.svg')  ),
       ),

    );
  }
}
