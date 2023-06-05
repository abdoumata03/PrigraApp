import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prigra_app/constants.dart';
import 'package:prigra_app/screens/signin.dart';
import 'package:prigra_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';

class ProfilScreen extends StatelessWidget {
    ProfilScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find();


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(onTap: () async {
              final box = GetStorage();
              box.write('access', '');
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLoggedIn', false);
              SharedPreferences prefsToken = await SharedPreferences.getInstance();
              prefsToken.setString('access', '') ;
              Get.to(SigninScreen());
            },
              child: SvgPicture.asset(
                'assets/icons/logout.svg', color: Colors.white,
                height: getHeight(30),
                width: getWidth(30),),
            ),
            SizedBox(width: getWidth(15),)

          ],
          title: Text(
            "Mon profile",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body:GetBuilder<AuthController>(

        builder: (controller)
    {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(25), vertical: getHeight(25)),
        child: Column(
          children: [
            SizedBox(
              height: getHeight(15),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: getHeight(10)),
              height: getHeight(100),
              decoration: BoxDecoration(
                  color: kLightAccent,
                  gradient: kGradient,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getHeight(10)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/icons/avatar.jpg'),
                    ),
                  ),
                  SizedBox(width: getWidth(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                           " ${ AuthController.instance.myDatareponsetype?['first_name']} ${AuthController.instance.myDatareponsetype?['last_name']}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getHeight(25)),
                      ),
                      SizedBox(
                        height: getHeight(8),
                      ),
                      Text(
                        '${AuthController.instance.myDatareponsetype?['email']}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getHeight(19)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            Container(
              width: SizeConfig.screenWidth - getWidth(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.red,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, kPrimaryAccent],
                ),


              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(15), vertical: getHeight(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text('Nom: ${AuthController.instance.myDatareponsetype?['first_name']}', style:
                    TextStyle(
                        fontSize: getHeight(20),
                        fontWeight: FontWeight.w500
                    )
                      ,),
                    SizedBox(height: getHeight(10),),
                    Text('Prenom: ${AuthController.instance.myDatareponsetype?['last_name']}', style:
                    TextStyle(
                        fontSize: getHeight(20),
                        fontWeight: FontWeight.w500
                    )
                      ,),
                    SizedBox(height: getHeight(13),),

                    Text('Date de naissance: ${AuthController.instance.myDatareponsetype?['birth_date']}', style:
                    TextStyle(
                        fontSize: getHeight(20),
                        fontWeight: FontWeight.w500
                    )
                      ,),
                    SizedBox(height: getHeight(13),),

                    Text('Matricule: ${AuthController.instance.myDatareponsetype?['num_inscription']}', style:
                    TextStyle(
                        fontSize: getHeight(20),
                        fontWeight: FontWeight.w500
                    )
                      ,),
                    SizedBox(height: getHeight(13),),

                    Text('Numéro de téléphone: ${AuthController.instance.myDatareponsetype?['phone_number']}', style:
                    TextStyle(
                        fontSize: getHeight(20),
                        fontWeight: FontWeight.w500
                    )
                      ,),

                  ],
                ), //textes
              ),

            ),
            SizedBox(
              height: getHeight(13),
            ),
            Expanded(
              child: Container(
                width: SizeConfig.screenWidth - getWidth(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.red,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, kPrimaryAccent],
                  ),


                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(15), vertical: getHeight(25)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text('Vous etes: ${AuthController.instance.meType }',
                        style:
                        TextStyle(
                            fontSize: getHeight(20),
                            fontWeight: FontWeight.w500
                        )
                        ,),
                      SizedBox(height: getHeight(13),),
                      Text('Etablissment: ${AuthController.instance.myDatareponsetype?['etablissment']}', style:
                      TextStyle(
                          fontSize: getHeight(20),
                          fontWeight: FontWeight.w500
                      )
                        ,),
                      SizedBox(height: getHeight(13),),
                      Text("Numéro d'inscription : ${AuthController.instance.myDatareponsetype?['num_inscription']}", style:
                      TextStyle(
                          fontSize: getHeight(20),
                          fontWeight: FontWeight.w500
                      )
                        ,),
                      SizedBox(height: getHeight(13),),
                      Text('Filière: ${AuthController.instance.myDatareponsetype?['filière']}', style:
                      TextStyle(
                          fontSize: getHeight(20),
                          fontWeight: FontWeight.w500
                      )
                        ,),
                      SizedBox(height: getHeight(13),),

                      Text('Spécialité: ${AuthController.instance.myDatareponsetype?['spécialité']}', style:
                      TextStyle(
                          fontSize: getHeight(20),
                          fontWeight: FontWeight.w500
                      )
                        ,),
                      SizedBox(height: getHeight(13),),



                      Text('Vous etes: ${AuthController.instance.meType }',
                        style:
                      TextStyle(
                          fontSize: getHeight(20),
                          fontWeight: FontWeight.w500
                      )
                        ,),

                    ],
                  ), //textes
                ),

              ),
            ),
            SizedBox(
              height: getHeight(25),
            ),

          ],
        ),
      );
    }
    ));

  }}