
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../size_config.dart';
import '../constants.dart';
 import 'home_page.dart';

class AnnoncesDetails extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:kLightAccent ,
      appBar: AppBar(
        leading: IconButton(onPressed: () { print('tas tappe back');
          Get.off(HomePage());

          },icon: SvgPicture.asset(
          "assets/icons/BackArrow.svg", color: Colors.white,
        ),),


      title: Text(
      "Annonces",
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
     centerTitle: true,
     backgroundColor: kPrimaryColor,
     ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          children: [
            SizedBox(
              height: getHeight(15),
            ),

            SizedBox(
              height: getHeight(395),
              width: getWidth(375),
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getHeight(19),
                      ),
                       Text(
                        "Photo de Promotion -  Année Universitaire",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(33, 38, 57, 1),
                        ),
                      ),
                      Image.asset(
                        "assets/icons/Event Photo SDK.png",//
                        width: getWidth(341),
                        height: getHeight(201),
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: getWidth(20),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ShapeCalendar.svg",
                                  ),
                                  SizedBox(width: getWidth(7),),
                                  const Text(
                                    "15 Mars 2022",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(33, 38, 57, 1),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(14),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ShapeBlueHorloge.svg",
                                  ),
                                  SizedBox(width: getWidth(7),),
                                  const Text(
                                    "14:00 - 14:30",
                                    style: TextStyle(
                                        color: Color.fromRGBO(33, 38, 57, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(14),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ShapeTag.svg",
                                  ),
                                  SizedBox(width: getWidth(7),),
                                  const Text(
                                    "Tous",
                                    style: TextStyle(
                                      color: Color.fromRGBO(33, 38, 57, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ShapeBluePosition.svg",
                                  ),
                                  SizedBox(width: getWidth(7),),
                                  const Text(
                                    "ESI SBA",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(33, 38, 57, 1),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(8),
                              ),
                              Row(
                                children: [
                                  SizedBox(width: getWidth(20),),
                                  const Text(
                                    "Entrée de l’école",
                                    style: TextStyle(
                                        color: Color.fromRGBO(72, 79, 104, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getHeight(20),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/ShapeBluePhone.svg",
                                  ),
                                  SizedBox(width: getWidth(7),),
                                  const Text(
                                    "0698 35 50 33",
                                    style: TextStyle(
                                      color: Color.fromRGBO(33, 38, 57, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Expanded(
              child: Container(
                width: getWidth(368),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child:  Text(
                    "L’École supérieure en informatique 08 mai 1945 de Sidi Bel Abbes organise au titre de l’année universitaire 2021-2022 un concours national d’accès à la formation de 3ème cycle, conformément à l’arrêté n°33 du 13 Janvier 2021 habilitant les établissements de l’enseignement supérieurs à la formation en vue de l’obtention du diplôme de doctorat et fixant le nombre de postes ouverts au titre de l’année universitaire 2021-2022.",
                    style: TextStyle(
                        fontSize: getHeight(14),
                        fontWeight: FontWeight.w400,
                        height: getHeight(2.4)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}