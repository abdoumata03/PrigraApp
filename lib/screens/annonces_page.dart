import 'package:flutter/material.dart';

import '../constants.dart';


class AnnonesPage extends StatelessWidget {
  const AnnonesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text(
          "Annonces",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(color: Colors.red,),

    );
  }
}
