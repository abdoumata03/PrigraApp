import 'package:flutter/material.dart';
import 'package:prigra_app/size_config.dart';

import '../constants.dart';


class NoNotification extends StatelessWidget {
  const NoNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
        color: kLightAccent, 
        child: Center(child: Text("Oops! il n'y a pas de notification", style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize:getHeight(25)
          
        ),),),

    );
  }
}
