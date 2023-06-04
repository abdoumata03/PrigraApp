// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:prigra_app/constants.dart';
import 'package:prigra_app/size_config.dart';

// a simple text button

class InkButton extends StatelessWidget {
  String text;
  double size; // Design Size
  Color color;
  Widget? route;

  InkButton({
    this.route,
    required this.text,
    required this.size,
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route!),
        ),
      },
      child: Text(
        text,
        style: TextStyle(
          color: this.color,
          fontWeight: FontWeight.w500,
          fontSize: getHeight(size),
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
