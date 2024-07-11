import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/core.dart';
import 'widgets.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PageTitleWidget(title: 'Money Sense'),
          const SizedBox(height: 30),
          Lottie.asset(
            'assets/animations/welcome_animation.json',
            width: double.infinity,
            height: 200,
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    RoundedButton(
                        text: 'Sign in',
                        press: () {
                          Modular.to.pushNamed('/auth/login');
                        }),
                    const SizedBox(height: 30),
                    RoundedButton(
                        text: 'Create an account',
                        press: () {
                          Modular.to.pushNamed('/auth/register');
                        }),
                    const SizedBox(height: 30),
                    GoogleWidget(press: () {}, welcomePage: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
