import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/theme.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  List<TextEditingController> controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  Timer? timer;

  int secondsRemaining = 5;
  bool enableResend = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    secondsRemaining = 5;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (secondsRemaining != 0) {
          secondsRemaining--;
        } else {
          enableResend = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // vertical centering
            crossAxisAlignment:
                CrossAxisAlignment.center, // horizontal centering
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Enter the authentication Code sent to your mail address hello@example.com",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    width: 40,
                    height: 40,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controllers[index],
                      maxLength: 1,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed:
                    enableResend
                        ? () {
                          startTimer();
                        }
                        : null,
                child: Text(
                  "Resend OTP  ${secondsRemaining == 0 ? "" : ":$secondsRemaining"}",
                  style: TextStyle(color: HanvisuColorTheme.blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
