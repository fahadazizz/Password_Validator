import 'package:flutter/material.dart';
import 'package:password_validator/row_check.dart';

class PasswordValidatorPage extends StatefulWidget {
  @override
  State<PasswordValidatorPage> createState() => _PasswordValidatorPageState();
}

class _PasswordValidatorPageState extends State<PasswordValidatorPage> {
  TextEditingController passwordController = TextEditingController();

  bool lengthCheck = false;
  bool specialCharacter = false;
  bool upperCase = false;

  void validatePassword(String value) {
    setState(() {
      lengthCheck = value.length > 6 && value.length < 12;

      specialCharacter = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      upperCase = value.contains(RegExp(r'[A-Z]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                height: 80,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: validatePassword,
                )),
            RowCheck(
                icon: lengthCheck
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                text: 'Length range > 6 and < 12'),
            RowCheck(
                icon: specialCharacter
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                text: 'Special Character'),
            RowCheck(
                icon: upperCase
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                text: 'UpperCase letter'),
            ElevatedButton(
              onPressed: () {
                if ((upperCase && specialCharacter && lengthCheck) == true) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error'),
                    ),
                  );
                }
              },
              child: Text('Go to Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
