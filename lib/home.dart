import 'package:design_projects/Days/day1.dart';
import 'package:design_projects/Days/day2.dart';
import 'package:design_projects/Days/day3.dart';
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
          ],
        ),
      ),
    );
  }
}
