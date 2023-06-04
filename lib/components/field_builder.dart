import 'package:flutter/material.dart';
import 'package:prigra_app/constants.dart';
import 'svg_builder.dart';
import 'package:prigra_app/size_config.dart';
import 'package:form_field_validator/form_field_validator.dart';

class InputField extends StatefulWidget {
  final String icon;

  // MultiValidator class for validating the forms
  // From Form_Field_Validator Package

  late final MultiValidator? multiValidator;
  final String hintText;
  final TextEditingController? myController;

  InputField({
    required this.icon,
    this.myController,
    this.multiValidator,
    required this.hintText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isHidden = true;
  bool _triggred = false;
  String inputText = '';

  void toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: getHeight(10)),
      child: TextFormField(
        autovalidateMode: (_triggred)
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        controller: widget.myController,
        textInputAction: TextInputAction.done,
        style: formTextStyle(),
        onEditingComplete: () {
          setState(() {
            _triggred = true;
          });
        },
        onChanged: (value) {
          setState(() {
            inputText = value;
          });
        },
        obscureText: (widget.hintText.contains('pass')) ? _isHidden : false,
        cursorColor: kGray,
        keyboardType: TextInputType.emailAddress,
        validator: widget.multiValidator!,
        decoration: InputDecoration(
          focusedBorder: focusedInputBorder,
          contentPadding: EdgeInsets.symmetric(vertical: getHeight(20)),
          prefixIconConstraints: const BoxConstraints(maxHeight: 25),
          prefixIcon: Container(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: SvgBuilder(
              path: widget.icon,
              height: getHeight(28),
              color: (inputText.isEmpty) ? kGray : kDarkColor,
            ),
          ),
          border: outlineInputBorder,
          fillColor: kPrimaryAccent,
          filled: true,
          hintText: widget.hintText,
          hintStyle: hintTextStyle,
          suffixIcon: widget.hintText.contains('pass')
              ? InkWell(
                  onTap: toggleVisibility,
                  child: Container(
                    padding: const EdgeInsets.only(right: 20, left: 12),
                    child: SvgBuilder(
                      path: _isHidden
                          ? 'assets/icons/Eye Off.svg'
                          : 'assets/icons/Eye.svg',
                      height: 27,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            maxHeight: getHeight(25),
          ),
        ),
      ),
    );
  }
}
