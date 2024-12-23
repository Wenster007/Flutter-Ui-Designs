import 'package:flutter/material.dart';

class Day7 extends StatefulWidget {
  const Day7({super.key});

  @override
  State<Day7> createState() => _Day7State();
}

List<String> days = ['Sun', 'Mun', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
List<int> dates = [12, 13, 14, 15, 16, 17, 18];
List<String> images = <String>[
  "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
];
List<String> images2 = <String>[
  "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
      "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
  "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
];

class _Day7State extends State<Day7> with TickerProviderStateMixin {
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

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1), // Start from off-screen
          end: Offset.zero, // Move to on-screen
        ).animate(CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeInOut,
        )),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAnimatedIcon(
                      icon: Icons.clear,
                      color: const Color(0xfff0f0f0),
                      onPressed: () => Navigator.pop(context),
                    ),
                    _buildAnimatedIcon(
                      icon: Icons.border_color,
                      color: const Color(0xfff0f0f0),
                      onPressed: () {
                        // Add action for edit icon
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildAnimatedContainer(
                  child: const Text(
                    '01:00-02:30pm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const FadeInText(
                  text: 'PM Meeting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const FadeInText(
                  text: "Discussion of tasks for the month",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 12),
                ImageStackWidget(images: images2),
                const SizedBox(height: 24),
                const FadeInText(
                  text: 'Plan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildAnimatedPlanSection(
                  text: 'Discussion of the brief from the customer',
                  time: '01:00-01:30',
                  backgroundColor: const Color(0xffd95639),
                  textColor: Colors.white,
                ),
                const SizedBox(height: 6),
                _buildAnimatedPlanSection(
                  text: 'Assignment of roles in the team',
                  time: '01:30-02:00',
                  backgroundColor: const Color(0xffededed),
                  textColor: Colors.black,
                ),
                const SizedBox(height: 6),
                _buildAnimatedPlanSection(
                  text: 'Summarising the results of the meeting',
                  time: '02:00-02:30',
                  backgroundColor: const Color(0xffededed),
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  Widget _buildAnimatedContainer({required Widget child}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 50,
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }

  Widget _buildAnimatedPlanSection({
    required String text,
    required String time,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              maxLines: null,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class FadeInText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const FadeInText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacity, child) {
        return Opacity(opacity: opacity, child: child);
      },
      child: Text(text, style: style),
    );
  }
}

class ImageStackWidget extends StatelessWidget {
  final List<String> images;

  const ImageStackWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < images.length; i++)
            Align(
              widthFactor: .3,
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
                margin: EdgeInsets.only(left: i.toDouble() * 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(images[i]),
                ),
              ),
            )
        ],
      ),
    );
  }
}
