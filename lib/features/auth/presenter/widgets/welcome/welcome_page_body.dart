import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/core.dart';
import 'welcome.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Money Sense',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppPallete.whiteColor,
            ),
          ),
          const SizedBox(height: 30),
          Lottie.asset(
            'assets/animations/welcome_animation.json',
            width: double.infinity,
            height: 250,
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              width: double.infinity,
              color: const Color(0xFF292929),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  RoundedButton(text: 'Sign in', press: () {}),
                  const SizedBox(height: 25),
                  RoundedButton(text: 'Create an account', press: () {}),
                  const SizedBox(height: 50),
                  GoogleWidget(press: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
