import 'package:design_projects/models/routes.dart';
import 'package:design_projects/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightBookingApp extends StatefulWidget {
  const FlightBookingApp({Key? key}) : super(key: key);

  @override
  State<FlightBookingApp> createState() => _FlightBookingAppState();
}

class _FlightBookingAppState extends State<FlightBookingApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Routes> routes = [
    Routes(
      title: "Pakistan to Germany",
      price: 260,
      iconPath: 'assets/images/pakistan.jpg',
    ),
    Routes(
      title: "Germany to Belgium",
      price: 260,
      iconPath: 'assets/images/germany.jpg',
    ),
    Routes(
      title: "France to Italy",
      price: 260,
      iconPath: 'assets/images/france.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Get.height * 0.07),
                        bottomRight: Radius.circular(Get.height * 0.07),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 7,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffaa80f8),
                          Color(0xff9f84f0),
                          Color(0xff8269ec),
                          Color(0xff6659e0),
                          Colors.deepPurpleAccent,
                          Colors.deepPurpleAccent,
                          Colors.deepPurpleAccent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Opacity(
                      opacity: 0.15,
                      child: Image.asset(
                        "assets/images/square.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(Get.height * 0.04),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/person.png",
                                    height: Get.height * 0.06,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        "Hi, Jonathan",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Get.height * 0.02,
                                      ),
                                      MyText(
                                        "Let's take a vacation",
                                        color: Colors.white,
                                        fontSize: Get.height * 0.016,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: Get.height * 0.03,
                                child: Icon(
                                  Icons.notifications_none,
                                  size: Get.height * 0.037,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          MyText(
                            "So where is your holiday destination?",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Get.height * 0.036,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Container(
                            height: Get.height * 0.45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                Get.height * 0.01,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  // minimal shadow color
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: Get.height * 0.08,
                                      width: Get.height * 0.42,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Get.height * 0.02,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.4),
                                          width: 1,
                                        ),
                                        color: Colors.grey.withOpacity(0.05),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "From",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: Get.height * 0.018,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/plane.png",
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                    height: Get.height * 0.04,
                                                    width: Get.height * 0.04,
                                                  ),
                                                  Container(
                                                    width: Get.height * 0.04,
                                                    height: 2,
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: Get.height * 0.02,
                                              ),
                                              MyText(
                                                "New York City",
                                                fontWeight: FontWeight.bold,
                                                fontSize: Get.height * 0.02,
                                              ),
                                              SizedBox(
                                                width: Get.height * 0.02,
                                              ),
                                              MyText(
                                                "NYC",
                                                fontSize: Get.height * 0.02,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: Get.height * 0.08,
                                      width: Get.height * 0.42,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Get.height * 0.02,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.4),
                                          width: 1,
                                        ),
                                        color: Colors.grey.withOpacity(0.05),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "From",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: Get.height * 0.018,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Transform.rotate(
                                                    angle: 7.2,
                                                    child: Image.asset(
                                                      "assets/images/plane.png",
                                                      color: Colors
                                                          .deepPurpleAccent,
                                                      height: Get.height * 0.04,
                                                      width: Get.height * 0.04,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Get.height * 0.04,
                                                    height: 2,
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: Get.height * 0.02,
                                              ),
                                              MyText(
                                                "Da Nang, Vietnam",
                                                fontWeight: FontWeight.bold,
                                                fontSize: Get.height * 0.02,
                                              ),
                                              SizedBox(
                                                width: Get.height * 0.02,
                                              ),
                                              MyText(
                                                "VN",
                                                fontSize: Get.height * 0.02,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: Get.height * 0.08,
                                      width: Get.height * 0.42,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Get.height * 0.02,
                                        ),
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.4),
                                          width: 1,
                                        ),
                                        color: Colors.grey.withOpacity(0.05),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: Get.height * 0.018,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.date_range_outlined,
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                    size: Get.height * 0.03,
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.005,
                                                  ),
                                                  Container(
                                                    width: Get.height * 0.04,
                                                    height: 2,
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: Get.height * 0.02,
                                              ),
                                              MyText(
                                                "28, August 2024",
                                                fontWeight: FontWeight.bold,
                                                fontSize: Get.height * 0.02,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: Get.height * 0.08,
                                      width: Get.height * 0.42,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Get.height * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Get.height * 0.04,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.4),
                                            width: 1,
                                          ),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xffaa80f8),
                                                Color(0xff9f84f0),
                                                Color(0xff8269ec),
                                                Colors.deepPurpleAccent,
                                                Color(0xff6659e0),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter)),
                                      child: const MyText(
                                        "Search Flight",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: Get.height * 0.085,
                                  right: Get.height * 0.045,
                                  child: CircleAvatar(
                                    radius: Get.height * 0.03,
                                    backgroundColor: Colors.deepPurpleAccent,
                                    child: Container(
                                      width: Get.height * 0.056,
                                      height: Get.height * 0.056,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          Get.height * 0.0365,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.swap_vert_rounded,
                                        color: Colors.deepPurpleAccent,
                                        size: Get.height * 0.043,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                "Popular Routes",
                                fontWeight: FontWeight.bold,
                                fontSize: Get.height * 0.023,
                              ),
                              MyText(
                                "See All",
                                color: Colors.deepPurpleAccent,
                                fontSize: Get.height * 0.02,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          SizedBox(
                            height: Get.height * 0.12,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                        Get.height * 0.01),
                                  ),
                                  margin:
                                      EdgeInsets.only(right: Get.height * 0.02),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: Get.height * 0.15,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            Get.height * 0.018,
                                          ),
                                          child: Image.asset(
                                            routes[index].iconPath,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.height * 0.02,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          MyText(
                                            routes[index].title,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Get.height * 0.021,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.005,
                                          ),
                                          MyText(
                                            "Start From",
                                            color: Colors.grey,
                                            fontSize: Get.height * 0.018,
                                          ),
                                          MyText(
                                            "\$${routes[index].price}.00",
                                            fontWeight: FontWeight.bold,
                                            fontSize: Get.height * 0.021,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Get.height * 0.01,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: routes.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, -3), // Shadow position
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                elevation: 0,
                selectedItemColor: Colors.deepPurpleAccent,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/home.png'),
                      color: _selectedIndex == 0
                          ? Colors.deepPurpleAccent
                          : Colors.grey,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/explore.png'),
                      color: _selectedIndex == 1
                          ? Colors.deepPurpleAccent
                          : Colors.grey,
                    ),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/ticket.png'),
                      color: _selectedIndex == 2
                          ? Colors.deepPurpleAccent
                          : Colors.grey,
                    ),
                    label: 'My Ticket',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/profile.png'),
                      color: _selectedIndex == 3
                          ? Colors.deepPurpleAccent
                          : Colors.grey,
                    ),
                    label: 'My Profile',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
