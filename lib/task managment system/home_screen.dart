import 'package:flutter/material.dart';
import 'package:task_managment_app/data.dart';
import 'package:task_managment_app/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int currentIndex = 0;

  late AnimationController _bottomSheetController;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 35, bottom: 25),
              decoration: const BoxDecoration(
                  color: Color(0xffd95639),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 35,
                          )),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn9zilY2Yu2hc19pDZFxgWDTUDy5DId7ITqA&s'))),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text(
                        'March',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      itemCount: days.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final selectedIndex = currentIndex == index;
                        return AnimatedOpacity(
                          opacity: selectedIndex ? 1.0 : 0.6,
                          duration: const Duration(seconds: 1),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              width: 45,
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.only(right: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: selectedIndex ? Colors.white : null),
                              child: Column(
                                children: [
                                  Text(
                                    days[index],
                                    style: TextStyle(
                                        color: selectedIndex
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    dates[index].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 6),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Opacity(opacity: value, child: child),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xfffcd36a)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Team Meeting',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          'Discuss the project with the team',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            _buildTaskCard(
              context,
              time: '12:00 - 01:00 PM',
              title: 'One-to-One',
              description: "Repeats every two weeks",
              images: images,
              onPressed: () {},
            ),
            const SizedBox(height: 6),
            _buildTaskCard(
              context,
              time: '1:00 - 03:30 PM',
              title: 'PM Meeting',
              description: "Discussion of tasks for the month",
              images: images2,
              onPressed: () {
                _bottomSheetController.forward();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => ScaleTransition(
                    scale: _bottomSheetController,
                    child: const FractionallySizedBox(
                      heightFactor: 0.80,
                      child: MyBottomSheet(),
                    ),
                  ),
                ).then((_) => _bottomSheetController.reverse());
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context,
      {required String time,
      required String title,
      required String description,
      required List<String> images,
      required VoidCallback onPressed}) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      time,
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ImageStackWidget(images: images),
                )
              ],
            ),
            Text(
              description,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xfff8f8f8)),
                  child: const Text(
                    'Today',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xfff8f8f8)),
                  child: const Text(
                    '1h:30m',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onPressed,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: const Icon(
                      Icons.call_made,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
