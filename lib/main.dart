import 'package:flutter/material.dart';
import 'package:otp_screens/UI/otpVerify.dart';
import 'package:otp_screens/UI/receiveNumber.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assesment Screens',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:SignupScreen(),
    );
  }
}
