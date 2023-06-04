import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prigra_app/size_config.dart';

class SvgBuilder extends StatelessWidget {
  late final double height;
  final String path;
  final Color? color;

  SvgBuilder({
    this.height = 60,
    required this.path,
    this.color,
  });

  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color,
      height: getHeight(height),
      width: getWidth(100),
    );
  }
}
