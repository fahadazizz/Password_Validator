import 'package:flutter/material.dart';
import 'package:password_validator/pssword_validator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswordValidatorPage(),
    );
  }
}
