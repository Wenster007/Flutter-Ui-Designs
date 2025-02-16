import 'package:design_projects/Days/day1.dart';
import 'package:design_projects/Days/day10.dart';
import 'package:design_projects/Days/day2.dart';
import 'package:design_projects/Days/day3.dart';
import 'package:design_projects/Days/day4.dart';
import 'package:design_projects/Days/day5.dart';
import 'package:design_projects/Days/day6.dart';
import 'package:design_projects/Days/day7.dart';
import 'package:design_projects/Days/day8.dart';
import 'package:design_projects/Days/day9.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Get.to(() => MovieApp());
              },
              child: Text("Day1"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => FlightBookingApp());
              },
              child: Text("Day2"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => ChildCamping());
              },
              child: Text("Day3"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => OnlineCourses());
              },
              child: Text("Day4"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => HealthTrackingApp());
              },
              child: Text("Day5"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => NFTApp());
              },
              child: Text("Day6"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => Day7());
              },
              child: Text("Day7"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => LiveStreamingApp());
              },
              child: Text("Day8"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              child: Text("Day9"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => Day10());
              },
              child: Text("Day10"),
            ),
          ],
        ),
      ),
    );
  }
}
