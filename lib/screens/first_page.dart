import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prigra_app/controllers/auth_controller.dart';
import 'package:prigra_app/size_config.dart';

import '../constants.dart';
import 'no_notification.dart';

class SlideAnimation3 extends StatelessWidget {
  @override
  AuthController authController = Get.find();


  var index = 0;

    build(BuildContext context)   {






    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
          ),
          body:StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc('${authController.me}')
                .collection('notifications').orderBy('time',descending: true,)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {


              return AnimationLimiter(
                child: ListView.builder(

                  padding: EdgeInsets.all(SizeConfig.screenWidth / 30),
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];

                    String title = document['title'];
                    String description = document['description'];

                    return GestureDetector(
                      onTap: () {
                        print('$index tapped');
                        authController.changeIndex(index);

                      } ,
                      child: AnimationConfiguration.staggeredList(
                        position: index,
                        delay: Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 2500),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: getWidth(15),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: SizeConfig.screenWidth / 20,
                                ),
                                decoration: BoxDecoration(
                                  color: index==authController.indexF? Colors.redAccent: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: getWidth(1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: getWidth(15),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/notification1.svg',
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: getHeight(15),
                                          ),
                                          Text('Notification',style: TextStyle(
                                            fontSize: getWidth(20),
                                            fontWeight: FontWeight.w600
                                          ),),
                                          SizedBox(
                                            height: getHeight(8),
                                          ),

                                          SizedBox(
                                            width: getWidth(300),
                                            child: Text(
                                              title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: getHeight(20),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: getHeight(5),
                                          ),
                                          SizedBox(
                                            width: getWidth(300),
                                            child: Text(
                                              description,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontSize: getHeight(15),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: getHeight(15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
      );
    });
  }
}
