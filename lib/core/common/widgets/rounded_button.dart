import 'package:flutter/material.dart';

import '../../core.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  const RoundedButton({super.key, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        textStyle: const TextStyle(fontSize: 16.0),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          color: AppPallete.secondTextColor,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
