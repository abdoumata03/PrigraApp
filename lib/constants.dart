import 'package:flutter/material.dart';
import 'package:prigra_app/size_config.dart';

const kPrimaryColor = Color(0xFF4345FD); // Primary Blue
const kPrimaryAccent = Color(0xFFE5ECFF); // Accent Blue
const kLightAccent = Color(0xFFF2F4F7); // Onboarding BG Color (Gray)
const kDarkColor = Color(0xFF212639); // Dark Text/Icons
const kDarkAccent = Color(0xFF484F68); // Light Text/Icons
const kGray = Color(0xFF9DA3B6); //Grayed out items
const kGreen = Color(0xFF1EC069); // Success Green

// Student or Visitor Screen
const kGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Colors.white, kPrimaryAccent],
);

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

var focusedInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15.0),
  borderSide: BorderSide(
    width: 1,
    color: kPrimaryColor.withOpacity(0.5),
  ),
);
var outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15.0),
  borderSide: BorderSide.none,
);
var OtpInputDecoration = InputDecoration(
  border: outlineInputBorder,
  focusedBorder: focusedInputBorder,
  fillColor: kPrimaryAccent,
  contentPadding: EdgeInsets.symmetric(vertical: getHeight(10)),
  filled: true,
);

var myBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: kPrimaryAccent,
);

dynamic kDuration = Duration(milliseconds: 300);
BorderRadius kRadius = BorderRadius.circular(15);
const kDefaultPadding = const EdgeInsets.symmetric(horizontal: 30.0);

var hintTextStyle = TextStyle(
  fontSize: getHeight(20),
  fontWeight: FontWeight.w300,
  color: kGray,
);

TextStyle formTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: getHeight(20),
    color: kDarkColor,
  );
}
