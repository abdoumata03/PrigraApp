// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import 'package:prigra_app/screens/signin.dart';
import 'package:prigra_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_page.dart';
import '../screens/splash_screen2.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var isLoading = false.obs;
  Map<String, dynamic>? myDatareponsetype;
    String?  meType;



  void updateIsLoading(bool currentStatus) {
    isLoading.value = currentStatus;
    update();
  }

  Future<void> loginUser(String email, String password) async {
    updateIsLoading(true);
    final response = await http.post(
      Uri.parse('https://prigra.onrender.com/auth/jwt/create'),
      body: {'email': email, 'password': password},
    );
    updateIsLoading(false);

    if (response.statusCode == 200) {
      Get.snackbar("Succes", "Vous vous avez bien authentifié",
          backgroundColor: Colors.green,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          titleText: const Text(
            'Réussite',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          messageText: const Text(
            'Vous vous avez bien authentifié',
            style: TextStyle(
              color: Colors.white,
            ),
          ));
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('response data:  $responseData');
      final String token = responseData['access'];
      // Store the token in SharedPreferences
      final box = GetStorage();
      box.write('access', token);

      SharedPreferences prefsToken = await SharedPreferences.getInstance();
      prefsToken.setString('access', token) ;
      // Login successful
      // You can navigate to another screen or handle the success in another way
      redirectToHomePage();

      // final boxLoggedIn =GetStorage();
      // boxLoggedIn.write('isLoggedIn', true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);





      final accessToken = await getToken();

      final meResponse = await http.get(
        Uri.parse('https://prigra.onrender.com/auth/users/me/'),
        headers: {'Authorization': 'JWT $accessToken'},
      );

      final Map meResponseBody = jsonDecode(meResponse.body);
      print('me response Body: $meResponseBody');


         meType = meResponseBody['type'] as String;
      print('mon type est: $meType');
      final String meTypeId = meResponseBody['type_id'].toString();

      final myTypeResponse = await http.get(
        Uri.parse('https://prigra.onrender.com/base/$meType/$meTypeId/'),
        headers: {'Authorization': 'JWT $accessToken'},
      );
     // final Map<String, dynamic> myDatareponsetype = jsonDecode(myTypeResponse.body) ?? '';
      myDatareponsetype = jsonDecode(myTypeResponse.body) as Map<String, dynamic>?;




update();
    } else {
      Get.snackbar("Erreur", "Erreur lors de l'authentification!",
          backgroundColor: Colors.redAccent,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          titleText: const Text(
            'Erreur',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          messageText: const Text(
            "Erreur lors de l'authentification!",
            style: TextStyle(
              color: Colors.white,
            ),
          ));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);



      update();

    }
  }
  void redirectToHomePage() {
    Get.offAll(HomePage());
  }
  Future<String> getToken() async {

    // final box = GetStorage();
    // final String? token = box.read('access');

    SharedPreferences prefsToken = await SharedPreferences.getInstance();
    final String? token = prefsToken.getString('access') ?? '';
    return token ?? '';
  }


}


