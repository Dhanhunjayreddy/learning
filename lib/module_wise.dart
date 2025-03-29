import 'package:flutter/material.dart';

class ModuleWise extends StatelessWidget {
  const ModuleWise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(child: Text('This is a course details page')),
    );
  }
}
