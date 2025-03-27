import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Progress',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CoursePage(),
    );
  }
}

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

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
          onPressed: () {},
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
                  MaterialPageRoute(builder: (context) => BlankPage()),
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

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blank Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('This is a blank page')),
    );
  }
}
