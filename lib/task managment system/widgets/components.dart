import 'package:flutter/material.dart';

import 'data.dart';

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
