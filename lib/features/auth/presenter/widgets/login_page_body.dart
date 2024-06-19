import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageTitleWidget(title: 'Sign in'),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const RoundedInputText(
                    inputTitle: 'Email',
                    hintText: 'Enter your email',
                    isPassword: false,
                  ),
                  const SizedBox(height: 30),
                  const RoundedInputText(
                    inputTitle: 'Password',
                    hintText: 'Enter password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  RoundedButton(text: 'Sign in', press: () {}),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        GoogleWidget(press: () {}, welcomePage: false),
        const SizedBox(height: 30),
      ],
    );
  }
}
