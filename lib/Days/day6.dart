import 'package:design_projects/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/Coin_details.dart';

class NFTApp extends StatefulWidget {
  const NFTApp({Key? key}) : super(key: key);

  @override
  State<NFTApp> createState() => _NFTAppState();
}

class _NFTAppState extends State<NFTApp> {
  final Map<String, String> topHeaderCategories = {
    "Assets": "36",
    "NFTs": "12",
    "DeFi": "24"
  };
  final List<String> selectedTopCategory = ["Assets", "36"];
  int currentNotification = 0;
  final List<String> secondCategories = [
    "Bonus",
    "One Cryptocurrency",
    "Several"
  ];
  String selectedSecondCategory = "Bonus";
  final List<CoinDetails> coinDetails = [
    CoinDetails(
      iconPath: "assets/images/ton.png",
      name: "TON",
      growth: "58,54% APR",
      price: "\$3.43M PKR",
    ),
    CoinDetails(
      iconPath: "assets/images/usdt.png",
      name: "USDT",
      growth: "48,54% APR",
      price: "\$12.43M PKR",
    ),
    CoinDetails(
      iconPath: "assets/images/btc.png",
      name: "BTC",
      growth: "25,54% APR",
      price: "\$1.43M PKR",
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070707),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.height * 0.02,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  "My wallet ",
                  color: Colors.white,
                  fontSize: Get.height * 0.042,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/bell.png",
                      color: Colors.white,
                      height: Get.height * 0.036,
                      cacheWidth: 120,
                    ),
                    SizedBox(
                      width: Get.height * 0.02,
                    ),
                    Image.asset(
                      "assets/icons/menu.png",
                      color: Colors.white,
                      height: Get.height * 0.036,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: topHeaderCategories.entries
                  .map(
                    (e) => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTopCategory[0] = e.key;
                              selectedTopCategory[1] = e.value;
                            });
                          },
                          child: Text.rich(
                            TextSpan(
                              text: '${e.key} ',
                              style: TextStyle(
                                fontSize: Get.height * 0.028,
                                fontWeight: FontWeight.w500,
                                color: e.key == selectedTopCategory[0]
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.6),
                              ),
                              children: <InlineSpan>[
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(2, -10),
                                    child: Text(
                                      e.value,
                                      style: TextStyle(
                                        fontSize: Get.height * 0.018,
                                        fontWeight: FontWeight.w500,
                                        color: e.value == selectedTopCategory[1]
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            SizedBox(
              height: Get.height * 0.17,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      bottom: -78,
                      right: -380,
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                          "assets/images/profit_green1.png",
                          height: 300,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "\$8,228",
                          style: TextStyle(
                            fontSize: Get.height * 0.07,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '.80',
                              style: TextStyle(
                                fontSize: Get.height * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "+\$16.48(+0.55%) ",
                          style: TextStyle(
                            fontSize: Get.height * 0.025,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff01ca76),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '7D',
                              style: TextStyle(
                                fontSize: Get.height * 0.025,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              height: Get.height * 0.25,
              padding: EdgeInsets.only(left: Get.height * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Get.height * 0.02,
                ),
                gradient: const LinearGradient(colors: [
                  Color(0xff1e21d9),
                  Color(0xff1640de),
                  Color(0xff0c62e4),
                  Color(0xff0c62e4),
                  Color(0xff047ee9),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.025,
                        backgroundColor: Colors.white.withOpacity(0.25),
                        child: const Icon(
                          Icons.diamond,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.3,
                        child: MyText(
                          "Stake TON and earn up to 10% staking rewards!",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.027,
                        ),
                      ),
                      Container(
                        height: Get.height * 0.05,
                        width: Get.height * 0.18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff070707),
                          borderRadius:
                              BorderRadius.circular(Get.height * 0.01),
                        ),
                        child: MyText(
                          "Read More",
                          color: Colors.white,
                          fontSize: Get.height * 0.022,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedSmoothIndicator(
                            activeIndex: 0,
                            count: 4,
                            // Fixed to trendingMovies.length
                            effect: ExpandingDotsEffect(
                              activeDotColor: Colors.white,
                              dotColor: Colors.white,
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: -10,
                    right: -37,
                    // left: 0,
                    child: Image.asset(
                      "assets/images/mobile.png",
                      height: Get.height * 0.285,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSecondCategory = secondCategories[0];
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "Bonus",
                        color: selectedSecondCategory == secondCategories[0]
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        fontSize: Get.height * 0.026,
                        fontWeight:
                            selectedSecondCategory == secondCategories[0]
                                ? FontWeight.bold
                                : null,
                      ),
                      Container(
                        width: Get.height * 0.1,
                        height: selectedSecondCategory == secondCategories[0]
                            ? 5
                            : 1,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            gradient:
                                selectedSecondCategory == secondCategories[0]
                                    ? const LinearGradient(
                                        colors: [
                                            Color(0xff0c62e4),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                          ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    : null),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSecondCategory = secondCategories[1];
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "One Cryptocurrency",
                        color: selectedSecondCategory == secondCategories[1]
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        fontSize: Get.height * 0.026,
                        fontWeight:
                            selectedSecondCategory == secondCategories[1]
                                ? FontWeight.bold
                                : null,
                      ),
                      Container(
                        width: Get.height * 0.26,
                        height: selectedSecondCategory == secondCategories[1]
                            ? 5
                            : 1,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            gradient:
                                selectedSecondCategory == secondCategories[1]
                                    ? const LinearGradient(
                                        colors: [
                                            Color(0xff0c62e4),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                          ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    : null),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSecondCategory = secondCategories[2];
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "Several",
                        color: selectedSecondCategory == secondCategories[2]
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        fontSize: Get.height * 0.026,
                        fontWeight:
                            selectedSecondCategory == secondCategories[2]
                                ? FontWeight.bold
                                : null,
                      ),
                      Container(
                        width: Get.height * 0.1,
                        height: selectedSecondCategory == secondCategories[2]
                            ? 5
                            : 1,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            gradient:
                                selectedSecondCategory == secondCategories[2]
                                    ? const LinearGradient(
                                        colors: [
                                            Color(0xff0c62e4),
                                            Color(0xff0c62e4),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                            Color(0xff047ee9),
                                          ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)
                                    : null),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: secondCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              coinDetails[index].iconPath,
                              height: Get.height * 0.06,
                            ),
                            SizedBox(
                              width: Get.height * 0.02,
                            ),
                            MyText(
                              coinDetails[index].name,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: Get.height * 0.028,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.local_fire_department_rounded,
                                  color: Color(0xff0777cc),
                                ),
                                SizedBox(
                                  width: Get.width * 0.01,
                                ),
                                MyText(
                                  coinDetails[index].growth,
                                  color: Color(0xff0777cc),
                                  fontSize: Get.height * 0.026,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            MyText(
                              coinDetails[index].price,
                              color: Colors.white.withOpacity(0.4),
                              fontSize: Get.height * 0.02,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.diamond_outlined, 0),
          _buildNavItem(Icons.screen_search_desktop_outlined, 1),
          _buildNavItem(Icons.shopping_bag_outlined, 2),
          _buildNavItem(Icons.map_outlined, 3),
        ],
      ),
    ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        color: _selectedIndex == index ? Color(0xff0777cc) : Colors.grey,
      ),
    );
  }
}
