import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/book_a_demo.dart';
import 'package:loginpage/forgot_password.dart';
import 'package:loginpage/main.dart';
import '../home/home_screen.dart';
import '../otp_verify/otp_verify_screen.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    "Welcome back",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text("Welcome back, enter your credentials to access"),
                  const SizedBox(height: 15),
                  const Text("Email Address"),
                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: inputTextFieldDecoration(hintText: "Name"),
                    validator: FormUtils.emailValidator,
                  ),
                  const SizedBox(height: 15),
                  const Text("Password"),
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
                        // validator:,
                      );
                    },
                    valueListenable: obscureText,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.pushNamed(context, '/forgot_password');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ForgotPassword(),
                        //   ),
                        // );
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          snack(
                            context,
                            'Password reset link sent to ${emailController
                                .text}',
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
                      child: Text("Login"),
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
                              color: Colors.blueAccent,
                              fontSize: 18,
                            ),
                            recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/book_a_demo");
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDemoScreen(),
                          ),
                        );*/
                      },
                      child: Text("Book Demo"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

ValueNotifier<bool> obscureText = ValueNotifier(true);
