import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:loginpage/main.dart';

import '../utilities/form_utils.dart';
import '../utilities/snackbar.dart';
import '../utilities/text_field_decoration.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 350),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome back, enter your credentials to\naccess your account.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        decoration: inputTextFieldDecoration(hintText: "Name"),
                        validator: FormUtils.emailValidator,
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ValueListenableBuilder(
                        builder: (context, obscure, _) {
                          return TextFormField(
                            obscureText: obscure,
                            decoration: inputTextFieldDecoration(
                              hintText: "Password",
                              prefix: IconButton(
                                icon: Icon(
                                  obscureText.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  obscureText.value = !obscureText.value;
                                },
                              ),
                            ),
                          );
                        },
                        valueListenable: obscureText,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot_password');
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 79, 18, 233),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              snack(
                                context,
                                'Password reset link sent to ${emailController.text}',
                              );
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              snack(
                                context,
                                'fields are not validated',
                                color: Colors.red,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 79, 18, 233),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: 'New Here?',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Create an Account',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 79, 18, 233),
                                  fontSize: 18,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => RegisterPage(),
                                          ),
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/book_a_demo");
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color.fromARGB(255, 79, 18, 233),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            "Book Demo",
                            style: TextStyle(
                              color: Color.fromARGB(255, 79, 18, 233),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

ValueNotifier<bool> obscureText = ValueNotifier(true);
