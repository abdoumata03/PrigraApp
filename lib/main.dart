import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prigra_app/controllers/auth_controller.dart';
import 'package:prigra_app/screens/home_page.dart';
import 'package:prigra_app/screens/signin.dart';
import 'package:prigra_app/screens/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);



  // WidgetsFlutterBinding.ensureInitialized();
  //
  // AuthController authController = AuthController.instance;
  // await authController.checkIfUserLoggedIn();
  runApp(const MainApp());
  Get.put(AuthController());

}

final box = GetStorage();
final boxLoggedIn = GetStorage();
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(AuthController());

    final isLoggedIn = boxLoggedIn.read('isLoggedIn') ?? false;
     return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Ubuntu',
      ),
      home: isLoggedIn ? HomePage() : SigninScreen(),


    );
  }
}
