import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prigra_app/controllers/auth_controller.dart';
import 'package:prigra_app/screens/first_page.dart';
import 'package:prigra_app/screens/home_page.dart';
import 'package:prigra_app/screens/profile_screen.dart';
   import 'package:prigra_app/screens/splash_screen2.dart';
 import 'package:prigra_app/size_config.dart';

void main()   {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  runApp(const MainApp());
   Get.put(AuthController());


}

final box = GetStorage();


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(AuthController());

    SizeConfig().init(context);




    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Ubuntu',
      ),
      home: MyCustomSplashScreen(),
    );
  }
}
