import 'package:flutter/material.dart';

class BookDemoScreen extends StatelessWidget {
  const BookDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book a Demo')),
      body: Center(child: Text('Book a Demo Screen')),
    );
  }
}
