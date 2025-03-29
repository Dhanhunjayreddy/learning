import 'package:flutter/material.dart';

import '../utilities/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(decoration: BoxDecoration(color: Colors.blue)),
            Text("Home", style: TextStyle(color: HanvisuColorTheme.blackColor)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Text(
                "Profile",
                style: TextStyle(color: HanvisuColorTheme.blackColor),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 77, 16, 230),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EXPLORE,LEARN,EXCEL",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                // SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find the perfect course for your growth",
                            // maxLines: 5,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Explore Courses",
                              style: TextStyle(
                                color: Color.fromARGB(255, 77, 16, 230),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "asset/images/online-certificate-course.png",
                      height: 150,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Details')),
      body: Center(child: Text('Course Details Screen')),
    );
  }
}

class ModuleScreen extends StatelessWidget {
  const ModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modules')),
      body: Center(child: Text('Module Screen')),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  const LessonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lesson Details')),
      body: Center(child: Text('Lesson Detail Screen')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Screen')),
    );
  }
}
