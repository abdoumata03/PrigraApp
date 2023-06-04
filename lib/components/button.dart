import 'package:flutter/material.dart';
import 'package:prigra_app/size_config.dart';
import 'package:prigra_app/constants.dart';

class Button extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color bgColor;

  // Each set of input fields must be wrapped within a Form with a unique formKey
  // The formKey is used for validation when clicking a button

  final GlobalKey<FormState> formKey;
  final Widget? route;

  Button(
      {required this.text,
      this.bgColor = kPrimaryColor,
      this.textColor = Colors.white,
      required this.formKey,
      this.route});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getHeight(55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: widget.bgColor,
        ),
        child: TextButton(
          onPressed: () => {
            if (widget.formKey.currentState!.validate())
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget.route!),
                )
              }
          },
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: getHeight(18),
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
