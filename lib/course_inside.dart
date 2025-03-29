import 'package:flutter/material.dart';
import 'package:loginpage/home/home_screen.dart';
import 'package:loginpage/module_wise.dart';

class CourseInside extends StatelessWidget {
  const CourseInside({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chapters = [
      {"title": "Chapter 1", "progress": 0},
      {"title": "Chapter 2", "progress": 0},
      {"title": "Chapter 3", "progress": 0},
      {"title": "Chapter 4", "progress": 0},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: const Text(
          "Flutter Development - Beginner",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                chapter["title"],
                style: const TextStyle(fontSize: 18),
              ),
              subtitle:
                  chapter["progress"] > 0
                      ? Text(
                        "${chapter["progress"]}% completed",
                        style: TextStyle(color: Colors.blue),
                      )
                      : const Text(
                        "Not Started",
                        style: TextStyle(color: Colors.grey),
                      ),
              trailing:
                  chapter["progress"] == 100
                      ? const Icon(Icons.check_circle, color: Colors.blue)
                      : const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModuleWise()),
                );
                // Handle navigation or actions
              },
            ),
          );
        },
      ),
    );
  }
}
