import 'package:design_projects/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthTrackingApp extends StatelessWidget {
  const HealthTrackingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.045,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: Get.height * 0.033,
                      backgroundColor: Colors.grey.withOpacity(0.25),
                      child: Image.asset("assets/images/person2.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          "Hello, Mike!",
                          fontWeight: FontWeight.bold,
                          fontSize: Get.height * 0.022,
                        ),
                        MyText(
                          "@mikertw",
                          fontSize: Get.height * 0.019,
                          color: Colors.black87.withOpacity(0.7),
                        ),
                      ],
                    )
                  ],
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: Get.height * 0.033,
                      backgroundColor: Colors.grey.withOpacity(0.25),
                      child: Image.asset(
                        "assets/icons/notification.png",
                        height: Get.height * 0.03,
                      ),
                    ),
                    Positioned(
                        top: Get.height * 0.005,
                        right: Get.height * 0,
                        child: CircleAvatar(
                          backgroundColor: Color(0xffff7676),
                          radius: Get.height * 0.008,
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            MyText(
              "Your Diagnostics",
              fontSize: Get.height * 0.05,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            Stack(
              children: [
                Container(
                  height: Get.height * 0.23,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffbbe7f0),
                    borderRadius: BorderRadius.circular(
                      Get.height * 0.03,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.5,
                    child: Transform.rotate(
                        angle: 60,
                        child: Image.asset(
                          "assets/icons/lines_design.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                  bottom: Get.height * 0.01,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/heartbeat_line.png",
                        height: Get.height * 0.12,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: Get.height * 0.01,
                  left: Get.height * 0.02,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.034,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/icons/heartbeat.png",
                          height: Get.height * 0.06,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            "Heartbeat",
                            fontWeight: FontWeight.w500,
                            fontSize: Get.height * 0.03,
                          ),
                          MyText(
                            "78 bpm",
                            fontSize: Get.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            Container(
              height: Get.height * 0.1,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: Get.height * 0.02,
              ),
              decoration: BoxDecoration(
                color: Color(0xfffbe285),
                borderRadius: BorderRadius.circular(Get.height * 0.03),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.034,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/icons/bracelet.png",
                          height: Get.height * 0.045,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            "Bracelet",
                            fontWeight: FontWeight.w500,
                            fontSize: Get.height * 0.03,
                          ),
                          MyText(
                            "Tracker",
                            fontWeight: FontWeight.w500,
                            fontSize: Get.height * 0.03,
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: Get.height * 0.04,
                    width: Get.height * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Get.height * 0.02)),
                    alignment: Alignment.center,
                    child: MyText(
                      "Connect",
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: Get.height * 0.16,
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.02,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: Get.height * 0.034,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "assets/icons/scale.png",
                            height: Get.height * 0.045,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              "Weight",
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.03,
                            ),
                            MyText(
                              "78 kg",
                              fontSize: Get.height * 0.02,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: Get.height * 0.16,
                    padding:
                    EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.02,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: Get.height * 0.034,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "assets/icons/height.png",
                            height: Get.height * 0.045,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              "Height",
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.03,
                            ),
                            MyText(
                              "183 cm",
                              fontSize: Get.height * 0.02,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.012,
            ),
            Stack(
              children: [
                Container(
                  height: Get.height * 0.245,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffcee8ba),
                    borderRadius: BorderRadius.circular(
                      Get.height * 0.03,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.5,
                    child: Transform.rotate(
                        angle: 60,
                        child: Image.asset(
                          "assets/icons/lines_design.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
right: 0,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/breath.png",
                        height: Get.height * 0.23,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: Get.height * 0.01,
                  left: Get.height * 0.02,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.034,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/icons/weather.png",
                          height: Get.height * 0.06,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            "Breathing",
                            fontWeight: FontWeight.w500,
                            fontSize: Get.height * 0.03,
                          ),
                          MyText(
                            "26 bpm",
                            fontSize: Get.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
