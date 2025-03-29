import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/course_inside.dart';
import 'package:loginpage/forgot_password.dart';

import 'package:loginpage/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => RegisterPage(),
        '/course-page': (context) => CourseInside(),
        '/book-a-demo': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPassword(),
      },
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Let's Get Started!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Name", style: TextStyle(fontSize: 16)),
              _buildTextField(hintText: "Enter your name"),
              const SizedBox(height: 10),
              const Text("Mobile Number", style: TextStyle(fontSize: 16)),
              _buildTextField(hintText: "Enter your mobile number"),
              const SizedBox(height: 10),
              const Text("Email Address", style: TextStyle(fontSize: 16)),
              _buildTextField(hintText: "Enter your email address"),
              const SizedBox(height: 10),
              const Text("Set Password", style: TextStyle(fontSize: 16)),
              _buildPasswordField(hintText: "6+ Characters, 1 Capital letter"),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseInside()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 77, 16, 230),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildPasswordField({required String hintText}) {
    return TextField(
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }
}
