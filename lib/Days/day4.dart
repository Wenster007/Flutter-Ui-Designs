import 'package:design_projects/models/category.dart';
import 'package:design_projects/models/subject.dart';
import 'package:design_projects/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnlineCourses extends StatefulWidget {
  const OnlineCourses({Key? key}) : super(key: key);

  @override
  State<OnlineCourses> createState() => _OnlineCoursesState();
}

class _OnlineCoursesState extends State<OnlineCourses> {
  int currentIndex = 0;
  List<Subject> subjects = [
    Subject(
      teacherName: "Alexander Cipto",
      rating: 4.8,
      subjectName: "Physics",
      currentTopic: "Static Fluids",
      topicDescription:
          "A fluid substance that is not moving or moving the substance",
      subjectCompletionProgress: 34,
    ),
    Subject(
      teacherName: "Linda Johnson",
      rating: 4.7,
      subjectName: "Mathematics",
      currentTopic: "Calculus",
      topicDescription: "The mathematical study of continuous change",
      subjectCompletionProgress: 45,
    ),
    Subject(
      teacherName: "Michael Brown",
      rating: 4.9,
      subjectName: "Chemistry",
      currentTopic: "Organic",
      topicDescription:
          "The study of the structure, properties, composition, reactions",
      subjectCompletionProgress: 50,
    ),
    Subject(
      teacherName: "Emily Davis",
      rating: 4.6,
      subjectName: "Biology",
      currentTopic: "Genetics",
      topicDescription:
          "The study of genes, genetic variation, and heredity in living organisms",
      subjectCompletionProgress: 60,
    ),
  ];
  List<Category> categories = [
    Category(
      primaryColor: Color(0xffff8686),
      secondaryColor: Color(0xfff3c9c9).withOpacity(0.4),
      title: "Try Out",
      iconPath: "assets/icons/book.png",
    ),
    Category(
      primaryColor: Color(0xff5fcb76),
      secondaryColor: Color(0xffcff5dd).withOpacity(0.7),
      title: "class",
      iconPath: "assets/icons/hat.png",
    ),
    Category(
      primaryColor: Color(0xff5ab5fa),
      secondaryColor: Color(0xffbbe5f5).withOpacity(0.7),
      title: "Exam",
      iconPath: "assets/icons/course.png",
    ),
    Category(
      primaryColor: Color(0xff5986ad),
      secondaryColor: Color(0xffbbdbfd).withOpacity(0.7),
      title: "Task",
      iconPath: "assets/icons/task.png",
    ),
    Category(
      primaryColor: Color(0xffffb04a),
      secondaryColor: Color(0xfffce4c7).withOpacity(0.7),
      title: "Exp",
      iconPath: "assets/icons/experience.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height * 0.238,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
            decoration: BoxDecoration(
              color: Color(0xffd9f5d1),
              borderRadius: BorderRadius.circular(
                Get.height * 0.04,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Get.height * 0.03,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            "assets/images/person2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: Get.height * 0.02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MyText(
                              "Vladmir Nurdin",
                              fontWeight: FontWeight.bold,
                              fontSize: Get.height * 0.022,
                            ),
                            MyText(
                              "Student",
                              color: Colors.black87.withOpacity(0.7),
                              fontSize: Get.height * 0.019,
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: Get.height * 0.03,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/icons/bell.png",
                        height: Get.height * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          "Completed Task",
                          color: Colors.black87.withOpacity(0.7),
                          fontSize: Get.height * 0.019,
                        ),
                        SizedBox(
                          height: Get.height * 0.003,
                        ),
                        MyText(
                          "4.387 Task",
                          fontSize: Get.height * 0.019,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyText(
                          "Completed Task",
                          color: Colors.black87.withOpacity(0.7),
                          fontSize: Get.height * 0.019,
                        ),
                        SizedBox(
                          height: Get.height * 0.003,
                        ),
                        MyText(
                          "⭐⭐⭐⭐⭐",
                          fontSize: Get.height * 0.019,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  width: 50,
                  height: 4,
                  color: Color(0xff7fd393),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          SizedBox(
            height: Get.height * 0.275,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (page) {
                setState(() {
                  currentIndex = page;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.height * 0.03),
                  width: Get.height * 0.482,
                  // Set a reasonable width for each item
                  decoration: BoxDecoration(
                    color: Color(0xfff3c9c9).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(Get.height * 0.02),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * 0.065,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                        decoration: BoxDecoration(
                          color: const Color(0xffff8686),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Get.height * 0.02),
                            topRight: Radius.circular(Get.height * 0.02),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/icons/profile.png",
                                  color: Colors.white,
                                  width: Get.height * 0.03,
                                ),
                                SizedBox(
                                  width: Get.height * 0.015,
                                ),
                                MyText(
                                  subject.teacherName,
                                  color: Colors.white,
                                  fontSize: Get.height * 0.02,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_outlined,
                                  color: Colors.white,
                                  size: Get.height * 0.025,
                                ),
                                SizedBox(
                                  width: Get.height * 0.005,
                                ),
                                MyText(
                                  subject.rating.toString(),
                                  color: Colors.white,
                                  fontSize: Get.height * 0.02,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.height * 0.03),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.012,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    MyText(
                                      subject.subjectName,
                                      color: Color(0xffff8686),
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.031,
                                    ),
                                    SizedBox(
                                      width: Get.height * 0.01,
                                    ),
                                    MyText(
                                      "-",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.031,
                                    ),
                                    SizedBox(
                                      width: Get.height * 0.01,
                                    ),
                                    MyText(
                                      subject.currentTopic,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Get.height * 0.031,
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/icons/open-magazine.png",
                                  height: Get.height * 0.035,
                                  color: Color(0xffff8686),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.012,
                            ),
                            MyText(
                              subject.topicDescription,
                              color: Colors.black87.withOpacity(0.6),
                              fontSize: Get.height * 0.02,
                            ),
                            SizedBox(
                              height: Get.height * 0.012,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  "Task",
                                  color: Colors.black87.withOpacity(0.6),
                                  fontSize: Get.height * 0.02,
                                ),
                                MyText(
                                  "${subject.subjectCompletionProgress}%",
                                  color: Color(0xffff8686),
                                  fontSize: Get.height * 0.02,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            LinearProgressIndicator(
                              backgroundColor:
                                  Color(0xfff3c9c9).withOpacity(0.8),
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffff8686),
                              value: subject.subjectCompletionProgress / 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: subjects.length,
            // Fixed to trendingMovies.length
            effect: ExpandingDotsEffect(
              activeDotColor: Color(0xffff8686),
              dotColor: Color(0xfff3c9c9).withOpacity(
                0.8,
              ),
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  "Must Try",
                  fontWeight: FontWeight.bold,
                  fontSize: Get.height * 0.022,
                ),
                MyText(
                  "View All",
                  color: Colors.black87.withOpacity(0.6),
                  fontSize: Get.height * 0.02,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < categories.length; i++)
                CircleAvatar(
                  radius: Get.height * 0.035,
                  backgroundColor: categories[i].secondaryColor,
                  child: Image.asset(
                    categories[i].iconPath,
                    height: Get.height * 0.04,
                    color: categories[i].primaryColor,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.height * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  "Online Classes",
                  fontWeight: FontWeight.bold,
                  fontSize: Get.height * 0.022,
                ),
                MyText(
                  "View All",
                  color: Colors.black87.withOpacity(0.6),
                  fontSize: Get.height * 0.02,
                ),
              ],
            ),
          ),
          Column(
            children: [
              for (int index = 0; index < subjects.length; index++)
                Container(
                  margin: EdgeInsets.only(
                    left: Get.height * 0.02,
                    right: Get.height * 0.02,
                    top: Get.height * 0.02,
                  ),
                  padding: EdgeInsets.all(
                    Get.height * 0.01,
                  ),
                  height: Get.height * 0.09,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(
                      Get.height * 0.015,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.035,
                        backgroundColor: index % 2 != 0
                            ? Color(0xfffce4c7).withOpacity(0.7)
                            : Color(0xffcff5dd).withOpacity(0.7),
                        child: Image.asset(
                          "assets/icons/open-magazine.png",
                          height: Get.height * 0.04,
                          color: index % 2 != 0
                              ? Color(0xffffb04a)
                              : Color(0xff5fcb76),
                        ),
                      ),
                      SizedBox(
                        width: Get.height * 0.02,
                      ),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  "${subjects[index].subjectName} - ${subjects[index].currentTopic}",
                                  fontWeight: FontWeight.w500,
                                ),
                                MyText(
                                  "⭐  ${subjects[index].rating}",
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  "${subjects[index].teacherName}",
                                  color: Colors.grey,
                                  fontSize: Get.height * 0.02,
                                ),
                                MyText(
                                  "Details",
                                  color: Colors.grey,
                                  fontSize: Get.height * 0.02,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
          SizedBox(height: Get.height * 0.03,)
        ],
      ),
    ));
  }
}
