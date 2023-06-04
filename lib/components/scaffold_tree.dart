import 'package:flutter/material.dart';

import '../size_config.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;

  MyScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: SizedBox(
              height: SizeConfig.safeAreaHeight,
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: this.child,
                // Start building the widget tree from the column
                // Use in pages with simillar structure (Signup screen not included)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
