


import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:prigra_app/controllers/annonces_controller.dart';

import 'auth_controller.dart';

class HomeController extends GetxController {

  int annoncesIndex = 0;









  void changeIndex(index) {
    annoncesIndex = index;
    update();
  }

}

