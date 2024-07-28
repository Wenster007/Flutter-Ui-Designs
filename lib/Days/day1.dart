import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_projects/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../my_text.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final List<String> categories = ["Popular", "Action", "Love", "Drama"];
  String selectedCategory = "Popular";
  final List<Movie> trendingMovies = [
    Movie("assets/images/black_widow.jpg", "Black Widow"),
    Movie("assets/images/endgame1.jpg", "End Game"),
    Movie("assets/images/flash1.jpg", "Flash"),
    Movie("assets/images/quantamania1.jpg", "Quantumania")
  ];
  final List<Movie> comingSoonMovies = [
    Movie("assets/images/iceage.jpg", "Ice Age"),
    Movie("assets/images/luca.jpg", "Luca"),
    Movie("assets/images/nemo.jpg", "Nemo"),
    Movie("assets/images/sharktale.jpg", "Shark Tale"),
  ];

  int currentIndex = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Sports Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Live Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('My List Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Downloads Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
                Colors.deepPurpleAccent,
                Colors.purple,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Get.height * 0.02),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                "Let's Explore",
                                color: Colors.grey,
                                fontSize: Get.height * 0.02,
                                fontWeight: FontWeight.w400,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MyText(
                                    "TRENDING",
                                    color: Colors.white,
                                    fontSize: Get.height * 0.029,
                                    wordSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: Get.height * 0.002,
                                  ),
                                  Transform.rotate(
                                    angle: -11.7,
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Colors.white,
                                      size: Get.height * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          MyText(
                            'See All',
                            color: Colors.grey,
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < categories.length; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = categories[i];
                                });
                              },
                              child: Row(
                                children: [
                                  if (selectedCategory == categories[i])
                                    Icon(
                                      Icons.circle,
                                      color: Colors.pinkAccent,
                                      size: Get.height * 0.02,
                                    ),
                                  SizedBox(
                                    width: Get.height * 0.01,
                                  ),
                                  MyText(
                                    categories[i],
                                    color: selectedCategory == categories[i]
                                        ? Colors.white
                                        : Colors.grey.withOpacity(0.8),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: trendingMovies.length,
                  itemBuilder: (context, index, realIdx) {
                    bool isCenter = index == currentIndex;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(Get.height * 0.02),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Get.height * 0.02),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              trendingMovies[index].imageLocalLink,
                              fit: BoxFit.cover,
                            ),
                            if (!isCenter)
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color: Colors.black.withOpacity(0),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    autoPlay: true,
                    aspectRatio: 1.8,
                    viewportFraction: 0.45,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: trendingMovies.length,
                  // Fixed to trendingMovies.length
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.pinkAccent,
                    dotColor: Colors.pinkAccent,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.all(Get.height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyText(
                            "COMING SOON",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.height * 0.032,
                          ),
                          MyText(
                            'See All',
                            color: Colors.grey,
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      SizedBox(
                        height: Get.height * 0.2,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              width: Get.height * 0.15,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.02),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.02),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      comingSoonMovies[index].imageLocalLink,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: comingSoonMovies.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyText(
                            "BEST FOR KIDS",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.height * 0.032,
                          ),
                          MyText(
                            'See All',
                            color: Colors.grey,
                            fontSize: Get.height * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      SizedBox(
                        height: Get.height * 0.2,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              width: Get.height * 0.15,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.02),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Get.height * 0.02),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      comingSoonMovies[comingSoonMovies.length -
                                              1 -
                                              index]
                                          .imageLocalLink,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: comingSoonMovies.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Get.height * 0.09,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: Get.height * 0.039,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.sports_esports_outlined,
                      size: Get.height * 0.039,
                    ),
                    label: 'Sports',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.live_tv,
                      size: Get.height * 0.039,
                    ),
                    label: 'Live',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.file_download_outlined,
                      size: Get.height * 0.039,
                    ),
                    label: 'My List',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline_sharp,
                      size: Get.height * 0.039,
                    ),
                    label: 'Downloads',
                  ),
                ],
              )),
        )
      ],
    ));
  }
}
