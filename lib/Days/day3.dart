import 'package:design_projects/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class ChildCamping extends StatelessWidget {
  const ChildCamping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff300d2d),
      body: Stack(
        children: [
          Container(
            height: Get.height * 0.45,
            width: double.infinity,
            child: Image.asset(
              "assets/images/camp.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.58,
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Get.height * 0.02,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              "Camp Big Sky Adventure",
                              fontWeight: FontWeight.bold,
                              fontSize: Get.height * 0.026,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.my_location_rounded,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: Get.height * 0.005,
                                ),
                                MyText(
                                  "Yellowstone National Park, Wyoming",
                                  fontSize: Get.height * 0.018,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: Get.height * 0.065,
                            width: Get.height * 0.06,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Get.height * 0.007),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                  Color(0xffc7c48e),
                                  Color(0xffdcce91),
                                  Color(0xffdcce91),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: MyText(
                              "28",
                              color: Color(0xff284517),
                              fontSize: Get.height * 0.034,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          MyText(
                            "June",
                            color: Color(0xff284517),
                            fontSize: Get.height * 0.026,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  const MyText(
                    "Description",
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  MyText(
                    "Explore Yellowstone and beyond!Get your feet wet and hands dirty, while you explore mountains with us.",
                    color: Colors.black54,
                    fontSize: Get.height * 0.02,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const MyText(
                    "Camp Details",
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffdcce91),
                                  Color(0xffdcce91),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * 0.035,
                              ),
                            ),
                            height: Get.height * 0.07,
                            width: Get.height * 0.07,
                            child: Transform.scale(
                              scale: 0.7,
                              child: Image.asset(
                                "assets/images/date.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.height * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                "Period",
                                color: Colors.grey,
                                fontSize: Get.height * 0.018,
                              ),
                              const MyText(
                                "3 Months",
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Get.height * 0.07,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffdcce91),
                                  Color(0xffdcce91),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * 0.035,
                              ),
                            ),
                            height: Get.height * 0.07,
                            width: Get.height * 0.07,
                            child: Transform.scale(
                              scale: 0.75,
                              child: Image.asset(
                                "assets/images/kid1.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.height * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                "Age",
                                color: Colors.grey,
                                fontSize: Get.height * 0.018,
                              ),
                              const MyText(
                                "9-12 Years",
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffdcce91),
                                  Color(0xffdcce91),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * 0.035,
                              ),
                            ),
                            height: Get.height * 0.07,
                            width: Get.height * 0.07,
                            child: Transform.scale(
                              scale: 0.9,
                              child: Image.asset(
                                "assets/images/tent.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.height * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                "Inside/Outside",
                                color: Colors.grey,
                                fontSize: Get.height * 0.018,
                              ),
                              const MyText(
                                "Outside",
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: Get.height * 0.055,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffdcce91),
                                  Color(0xffdcce91),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                  Color(0xffa6b069),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * 0.035,
                              ),
                            ),
                            height: Get.height * 0.07,
                            width: Get.height * 0.07,
                            child: Transform.scale(
                              scale: 0.66,
                              child: Image.asset(
                                "assets/images/food.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.height * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                "Meals Provided",
                                color: Colors.grey,
                                fontSize: Get.height * 0.018,
                              ),
                              const MyText(
                                "Yes",
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  const Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height * 0.07,
                        width: Get.height * 0.38,
                        decoration: BoxDecoration(
                          color: Color(0xff5a682b),
                          borderRadius:
                              BorderRadius.circular(Get.height * 0.04),
                        ),
                        alignment: Alignment.center,
                        child: const MyText(
                          "Reserve a spot",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.07,
                        width: Get.height * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.7,
                          ),
                          borderRadius:
                              BorderRadius.circular(Get.height * 0.035),
                        ),
                        child: Icon(
                          Icons.calendar_month_sharp,
                          size: Get.height * 0.038,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: Get.height * 0.03,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: Get.height * 0.026,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.03,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.bookmark_border_outlined,
                          size: Get.height * 0.026,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.01,
                      ),
                      CircleAvatar(
                        radius: Get.height * 0.03,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.ios_share_outlined,
                          size: Get.height * 0.026,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
