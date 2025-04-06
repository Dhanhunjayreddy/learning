import 'package:flutter/material.dart';
import 'package:loginpage/chapter_play/chapter_play_screen.dart';
import 'package:loginpage/courses.dart';

class ModuleWise extends StatelessWidget {
  const ModuleWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const CourseListPage(),
    );
  }
}

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CoursePage()),
            );
          },
        ),
        title: const Text('Courses'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          LessonCard(lessonNumber: 'Lesson 1', title: 'Basic Introduction'),
          LessonCard(lessonNumber: 'Lesson 2', title: 'Variables'),
          LessonCard(lessonNumber: 'Lesson 3', title: 'Lorem Ipsum'),
          LessonCard(lessonNumber: 'Lesson 4', title: 'Lorem Ipsum'),
          LessonCard(lessonNumber: 'Lesson 5', title: 'Lorem Ipsum'),
          LessonCard(lessonNumber: 'Lesson 6', title: 'Lorem Ipsum'),
          LessonCard(lessonNumber: 'Lesson 7', title: 'Lorem Ipsum'),
        ],
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String lessonNumber;
  final String title;

  const LessonCard({
    super.key,
    required this.lessonNumber,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (lessonNumber == 'Lesson 1') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChapterPlayScreen()),
          );
        }
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_circle_outline, color: Colors.blue),
          ),
          title: Text(
            lessonNumber,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          subtitle: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        ),
      ),
    );
  }
}
