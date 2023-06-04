import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double safeAreaHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    safeAreaHeight = mediaQueryData.size.height -
        mediaQueryData.padding.top -
        mediaQueryData.padding.bottom;
  }
}

// Gets the propotional height as per screen size
double getHeight(double dimension) {
  double screenHeight = SizeConfig.screenHeight;
  // 926 is the frame height for the design
  return screenHeight * (dimension / 926);
}

// Gets the propotional width as per screen size
double getWidth(double dimension) {
  double screenWidth = SizeConfig.screenWidth;
  // 428 is the frame width for the design
  return screenWidth * (dimension / 428);
}
