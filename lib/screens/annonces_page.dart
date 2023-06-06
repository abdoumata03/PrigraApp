import 'dart:ui';

import 'package:flutter/material.dart';
 import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants.dart';
import '../controllers/home_controller.dart';
import '../size_config.dart';
import 'event.dart';


class AnnonesPage extends StatelessWidget {
  AnnonesPage({Key? key}) : super(key: key);

  HomeController homeController= Get.find();

  @override
  Widget build(BuildContext context) {



    double _w = MediaQuery
        .of(context)
        .size
        .width;


    return GetBuilder<HomeController>(builder: (homeController)
    {
      return  Scaffold(
          appBar: AppBar(
            title: Text(
              "Annonces",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
          ),
          backgroundColor:kLightAccent ,
          body:   ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) =>GestureDetector(
              onTap: () {
                print('tas tapper :$index');
                homeController.changeIndex(index);


                Get.to(AnnoncesDetails());
              },
              child: SizedBox(
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
            ),
          )

      );

    }
    );
  }
}
