import 'dart:async';

import 'package:design_projects/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveStreamingApp extends StatefulWidget {
  const LiveStreamingApp({super.key});

  @override
  State<LiveStreamingApp> createState() => _LiveStreamingAppState();
}

class _LiveStreamingAppState extends State<LiveStreamingApp> {
  List<String> names = [
    'Jenny',
    'Henry',
    'Ajun',
    'Wades',
  ];

  List<Color> listOfGradientColors = [
    Color(0xfffeb45a),
    Color(0xfffe6238),
    Color(0xffe3526a),
    Color(0xff917095),
    Color(0xffef8423),
    Color(0xff6f1620),
    Color(0xff5c94bc),
    Color(0xff305896),
  ];
  List<Color> listOfGradientColors2 = [
    Color(0xfffa709a),
    Color(0xfffee140),
    Color(0xff23a6d5),
    Color(0xff23d5ab),
    Color(0xfff12711),
    Color(0xfff5af19),
    Color(0xff833ab4),
    Color(0xfffd1d1d),
  ];

  List<String> listOfTexts = [
    'Meet',
    'Coday',
    'Most viewed',
    'Host',
    'Zirka',
    'Sharing',
    'Most viewed',
    'Host',
    'Zirka',
    'Event',
    'Most engaged',
    'Host',
    'Zirka',
    'Sharing',
    'Most viewed',
    'Host',
  ];

  List<String> liveStreamingDate = [
    "84.3k",
    "WINDS OF",
    "DESTINY",
    "Ronald",
    "2m",
    "1.2M",
    "THREAD OF",
    "FATE",
    "Cody Ray",
    "1h",
    "20.3k",
    "PROCESS OF",
    "WORK",
    "James Clear",
    "2h"
  ];

  late ScrollController _controller1;
  late ScrollController _controller2;
  late Timer _timer1;
  late Timer _timer2;

  @override
  void initState() {
    super.initState();
    _controller1 = ScrollController();
    _controller2 = ScrollController();

    // Start at the middle to create the illusion of infinite scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller1.jumpTo(_controller1.position.maxScrollExtent);
      _controller2.jumpTo(_controller2.position.maxScrollExtent / 2);
    });

    _timer1 = Timer.periodic(
        Duration(milliseconds: 50), (_) => _autoScroll(_controller1));
    _timer2 = Timer.periodic(
        Duration(milliseconds: 50), (_) => _autoScroll(_controller2));
  }

  void _autoScroll(ScrollController controller) {
    if (controller.hasClients) {
      double maxScroll = controller.position.maxScrollExtent;
      double currentScroll = controller.offset;
      double delta = 2.0;

      if (currentScroll + delta >= maxScroll) {
        // Smoothly reset to the start when reaching the end
        controller.jumpTo(0);
      } else {
        controller.jumpTo(currentScroll + delta);
      }
    }
  }

  @override
  void dispose() {
    _timer1.cancel();
    _timer2.cancel();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xff191919),
                      radius: Get.height * 0.03,
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      ),
                    ),
                    const MyText(
                      "Zirka",
                      fontFamily: "RubikMonoOne",
                      color: Colors.white,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Get.height * 0.03),
                      child: CircleAvatar(
                        radius: Get.height * 0.03,
                        child: Image.asset("assets/images/user1.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyText(
                      'Zirka',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    MyText(
                      'shorts',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                height: Get.height * 0.15,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    width: Get.height * 0.13,
                    margin:
                        EdgeInsets.only(right: 10, left: index == 0 ? 16 : 0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.01,
                      ),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Get.height * 0.01,
                          ),
                          child: Image.asset(
                            'assets/images/user${index + 2}.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 5,
                          right: 60,
                          bottom: 8,
                          child: Container(
                            height: Get.height * 0.024,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.02)),
                            alignment: Alignment.center,
                            child: MyText(
                              names[index],
                              fontSize: Get.height * 0.013,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          'Top',
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        MyText(
                          'creators',
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    MyText(
                      'See all',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                height: Get.height * 0.17,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller1,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    width: Get.width * 0.7,
                    height: Get.height * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.02,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          listOfGradientColors[index * 2],
                          listOfGradientColors[index * 2 + 1],
                          listOfGradientColors[index * 2],
                        ],
                        stops: const [0, 0.7, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 16,
                          ),
                          width: Get.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                listOfTexts[index * 4],
                                fontFamily: 'RubikMonoOne',
                                color: Colors.white,
                              ),
                              MyText(
                                listOfTexts[index * 4 + 1],
                                fontFamily: 'RubikMonoOne',
                                color: Colors.white,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MyText(
                                    listOfTexts[index * 4 + 2],
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: Get.height * 0.015,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  MyText(
                                    listOfTexts[index * 4 + 3],
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: Get.height * 0.015,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -90,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/circle_lines.png',
                                color: Colors.white,
                                height: Get.height * 0.3,
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                'assets/images/user${index + 6}.png',
                                width: Get.width * 0.35,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              SizedBox(
                height: Get.height * 0.17,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _controller2,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    width: Get.width * 0.7,
                    height: Get.height * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.02,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          listOfGradientColors2[index * 2],
                          listOfGradientColors2[index * 2 + 1],
                          listOfGradientColors2[index * 2],
                        ],
                        stops: const [0, 0.7, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 16,
                          ),
                          width: Get.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                listOfTexts[index * 4],
                                fontFamily: 'RubikMonoOne',
                                color: Colors.white,
                              ),
                              MyText(
                                listOfTexts[index * 4 + 1],
                                fontFamily: 'RubikMonoOne',
                                color: Colors.white,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MyText(
                                    listOfTexts[index * 4 + 2],
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: Get.height * 0.015,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  MyText(
                                    listOfTexts[index * 4 + 3],
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: Get.height * 0.015,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -90,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/circle_lines.png',
                                color: Colors.white,
                                height: Get.height * 0.3,
                              ),
                            ),
                            Positioned(
                              child: Image.asset(
                                'assets/images/user${index + 6}.png',
                                width: Get.width * 0.35,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyText(
                      'Creators',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    MyText(
                      'on live',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                height: Get.height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    width: Get.width * 0.35,
                    margin:
                        EdgeInsets.only(right: 10, left: index == 0 ? 16 : 0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.014,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Get.height * 0.014),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/images/live${index + 1}.jpg',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 5,
                            right: 90,
                            top: 8,
                            child: Container(
                              height: Get.height * 0.024,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.circular(Get.height * 0.02)),
                              alignment: Alignment.center,
                              child: MyText(
                                "LIVE",
                                fontSize: Get.height * 0.013,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 100,
                            right: 0,
                            top: 8,
                            child: MyText(
                              liveStreamingDate[index*5],
                              fontSize: Get.height * 0.013,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Positioned(
                            left: 100,
                            right: 0,
                            top: 8,
                            child: MyText(
                              liveStreamingDate[index*5],
                              fontSize: Get.height * 0.013,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyText(
                      'Your',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    MyText(
                      'favourites',
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                height: Get.height * 0.1,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    width: Get.height * 0.1,
                    margin:
                        EdgeInsets.only(right: 20, left: index == 0 ? 16 : 0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.05,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Get.height * 0.05,
                      ),
                      child: Image.asset(
                        'assets/images/user${index + 2}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
