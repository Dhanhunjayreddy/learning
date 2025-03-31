import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Chapter1"),
            subtitle: Text("100% Completed"),
            trailing: Icon(Icons.check_circle_outline),
          );
        },
      ),
    );
  }
}
