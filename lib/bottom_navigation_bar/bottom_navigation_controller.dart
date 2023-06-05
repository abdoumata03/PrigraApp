import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isTaped = false;
  int bottmIndex = 0;
  var currenPage;

  void saveCurrentPage(distination) {
    currenPage = distination;
    update();
  }

  void changeIndex(index) {
    bottmIndex = index;
     update();
  }

  void closeDrawer() {

    Get.back();
    update();
  }

  void changeRout(number) {
    bottmIndex = number;

    update();
  }

  void changeIsTaped() {
    isTaped = !isTaped;
    update();
  }
}
