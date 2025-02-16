import 'package:design_projects/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Day10 extends StatefulWidget {
  const Day10({super.key});

  @override
  State<Day10> createState() => _Day10State();
}

class _Day10State extends State<Day10> {
  final PageController _pageController = PageController();

  final List<String> data = [
    'Biryani',
    'biryani.png',
    'Spaghetti',
    'spaghetti.png',
    'Salad',
    'salad.png',
    'Paneer Masala',
    'paneer-masala.png'
  ];

  final List<String> tabBarData = [
    'Salad',
    'salad.png',
    'Soup',
    'soup.png',
    'Pizza',
    'pizza.png',
    'Desi',
    'biryani.png'
  ];

  int selectedIndex = 0;
  int _navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          "Hey, Margaret",
                          color: Colors.white,
                          fontSize: Get.height * 0.034,
                          fontWeight: FontWeight.bold,
                        ),
                        MyText(
                          "Ready to cook something?",
                          color: Colors.white.withOpacity(0.4),
                          fontSize: Get.height * 0.021,
                        ),
                      ],
                    ),
                    Container(
                      height: Get.height * 0.065,
                      width: Get.height * 0.065,
                      decoration: BoxDecoration(
                        color: Color(0xfff1641a),
                        borderRadius: BorderRadius.circular(
                          Get.height * 0.01,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Get.height * 0.01,
                        ),
                        child: Image.asset(
                          "assets/images/person3.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: Get.height * 0.22,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: Get.height * 0.2,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(Get.height * 0.02),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                "Popular For Dinner",
                                color: Colors.white.withOpacity(0.4),
                                fontSize: Get.height * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    data[index * 2],
                                    color: Colors.white,
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: Color(0xfff1641a),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      MyText(
                                        "30 Min",
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: Get.height * 0.018,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        color: Color(0xfff1641a),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      MyText(
                                        "Easy Lvl",
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: Get.height * 0.018,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -Get.width * 0.12,
                          top: -Get.height * 0.004,
                          child: Opacity(
                            opacity: 0.5,
                            child: Image.asset(
                              'assets/images/dotted-lines.png',
                              height: Get.height * 0.21,
                              color: Color(0xffe7dd34),
                            ),
                          ),
                        ),
                        Positioned(
                          right: Get.width * 0.2,
                          bottom: -Get.height * 0.032,
                          child: Image.asset(
                            'assets/images/mint-leaves.png',
                            height: Get.height * 0.15,
                          ),
                        ),
                        Positioned(
                          right: -Get.width * 0.025,
                          top: -Get.height * 0.04,
                          child: Transform.rotate(
                            angle: 160,
                            child: Image.asset(
                              'assets/images/mint-leaves.png',
                              height: Get.height * 0.15,
                            ),
                          ),
                        ),
                        Positioned(
                          right: Get.width * 0.013,
                          top: Get.height * 0.006,
                          child: Image.asset(
                            'assets/images/${data[index * 2 + 1]}',
                            height: Get.height * 0.19,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: data.length ~/ 2,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 16.0,
                      dotHeight: 8.0,
                      dotColor: Colors.grey.withOpacity(0.2),
                      activeDotColor: Color(0xfff1641a),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      'Meal Category',
                      color: Colors.white,
                      fontSize: Get.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                    Transform.rotate(
                      angle: 26.7,
                      child: Image.asset(
                        'assets/images/options.png',
                        height: Get.height * 0.02,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: Get.height * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 0,
                      right: index == data.length - 1 ? 0 : 8,
                    ),
                    width: Get.height * 0.14,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Color(0xfff1641a)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(8), // Added borderRadius
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index * 2 ~/ 2;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/${tabBarData[index * 2 + 1]}',
                            height: Get.height * 0.035,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          MyText(
                            tabBarData[index * 2],
                            color: Colors.white,
                            fontSize: Get.height * 0.018,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: Get.height * 0.28,
                      width: Get.height * 0.18,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: Get.height * 0.23,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(Get.height * 0.03),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: Get.height * 0.08,
                                ),
                                MyText(
                                  data[index * 2],
                                  color: Colors.white,
                                  fontSize: Get.height * 0.02,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      Icon(
                                        Icons.star,
                                        color: Color(0xfff1641a),
                                        size: Get.height * 0.022,
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        MyText(
                                          "10",
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: Get.height * 0.017,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                        MyText(
                                          "Min",
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: Get.height * 0.017,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      "|",
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: Get.height * 0.017,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                    Column(
                                      children: [
                                        MyText(
                                          "Easy",
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: Get.height * 0.017,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                        MyText(
                                          "Lvl",
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: Get.height * 0.017,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: -Get.height * 0.05,
                            left: Get.width * 0.08,
                            child: Image.asset(
                              'assets/images/${data[index * 2 + 1]}',
                              height: Get.height * 0.13,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationIndex,
        onTap: (int index) {
          setState(() {
            _navigationIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xfff1641a),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color(0xff212121),
        items: [
          _buildNavItem(Icons.home_outlined, "Home", 0),
          _buildNavItem(Icons.search, "Search", 1),
          _buildNavItem(Icons.favorite_outline, "Favourite", 2),
          _buildNavItem(Icons.settings_outlined, "Setting", 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(icon,
              color:
                  _navigationIndex == index ? Color(0xfff1641a) : Colors.grey),
          SizedBox(height: 4),
          if (_navigationIndex == index)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xfff1641a),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
