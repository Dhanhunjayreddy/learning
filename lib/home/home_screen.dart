import 'package:flutter/material.dart';
import 'package:loginpage/courses.dart';
import 'package:loginpage/profile/profile_screen.dart';

import '../utilities/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (e, _) {},
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset("asset/images/leading-menu.png", height: 30),
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(decoration: BoxDecoration(color: Colors.blue)),
              Text(
                "Home",
                style: TextStyle(color: HanvisuColorTheme.blackColor),
              ),
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: Text(
                  "LogOut",
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
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoursePage(),
                                  ),
                                );
                              },
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                // image: DecorationImage(image: NetworkImage("https://plus.unsplash.com/premium_photo-1683865776032-07bf70b0add1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXJsfGVufDB8fDB8fHww")),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("asset/images/flutter_icon.jpeg", height: 40),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Development",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Flutter Developement - Beginner Level",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "42 Hrs",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: 12),
                                Icon(
                                  Icons.menu_book_outlined,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "12 Chapters",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "36% Progress",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: 0.36,
                      minHeight: 8,
                      backgroundColor: Colors.grey[300],
                      color: Color.fromARGB(255, 77, 16, 230),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

void _showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("This is a simple alert dialog."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              // Perform any action here
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
