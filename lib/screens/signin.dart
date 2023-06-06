// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prigra_app/components/scaffold_tree.dart';
import 'package:prigra_app/constants.dart';
import 'package:prigra_app/controllers/auth_controller.dart';
import 'package:prigra_app/form_validators.dart';
import 'package:prigra_app/screens/success.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:prigra_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/field_builder.dart';
import '../../components/svg_builder.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final emailPassFormKey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MyScaffold(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: getHeight(140)),
            SvgBuilder(path: 'assets/illustrations/logo.svg'),
            SizedBox(height: getHeight(90)),
            Text(
              'Se connecter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getHeight(32),
              ),
            ),
            SizedBox(height: getHeight(25)),
            Form(
              key: emailPassFormKey,
              child: Column(children: [
                InputField(
                  multiValidator: schoolMailValidator(),
                  icon: 'assets/icons/Mail.svg',
                  hintText: 'Adresse email',
                  myController: mailController,
                ),
                InputField(
                  multiValidator: passwordValidator(),
                  hintText: 'Mot de pass',
                  icon: 'assets/icons/Key.svg',
                  myController: passwordController,
                ),
              ]),
            ),
            const Expanded(child: SizedBox()),
            GetBuilder<AuthController>(builder: (controller) {
              return Container(
                height: getHeight(55),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: controller.isLoading.value
                      ? kPrimaryColor.withOpacity(0.8)
                      : kPrimaryColor,
                ),
                child: TextButton(
                  onPressed: () => {

                     if (emailPassFormKey.currentState!.validate())
                      {


                         AuthController.instance.loginUser(
                            mailController.text.trim(),
                            passwordController.text.trim()),


                      }
                  },
                  child: controller.isLoading.value
                      ? SizedBox(
                          height: getHeight(25),
                          width: getHeight(25),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      : Text(
                          'Continuer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getHeight(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              );
            }),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
