import 'package:flutter/material.dart';

class RowCheck extends StatelessWidget {
  Icon icon;
  String? text;
  RowCheck({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        Text('$text'),
      ],
    );
  }
}
