
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prigra_app/controllers/auth_controller.dart';
import 'package:prigra_app/screens/event.dart';
import 'package:prigra_app/screens/first_page.dart';
import 'package:prigra_app/screens/home_page.dart';
import 'package:prigra_app/screens/profile_screen.dart';
   import 'package:prigra_app/screens/splash_screen2.dart';
 import 'package:prigra_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'controllers/home_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main()   async {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);



   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   Get.put(AuthController());
   Get.put(HomeController());




  runApp(const MainApp());



   SharedPreferences temail = await SharedPreferences.getInstance();
   final   emailS = temail.getString('email') ;
   SharedPreferences tpassword = await SharedPreferences.getInstance();
   final   passwordS = tpassword.getString('password') ;
   AuthController authController = Get.find();
   final response = await http.post(
     Uri.parse('https://prigra.onrender.com/auth/jwt/create'),
     body: {'email': emailS, 'password': passwordS},
   );
   if (response.statusCode == 200) {
     print('data restored');
     AuthController.instance.fetchingData(response);

     dynamic myId = await authController.getMyId();
       authController.me = myId.toString();


   }

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
