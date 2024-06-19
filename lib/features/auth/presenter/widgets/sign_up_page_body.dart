import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'widgets.dart';

class SignUpPageBody extends StatelessWidget {
  const SignUpPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageTitleWidget(title: 'Register'),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const RoundedInputText(
                    inputTitle: 'Name',
                    hintText: 'Enter your name',
                    isPassword: false,
                  ),
                  const SizedBox(height: 30),
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
                  const SizedBox(height: 70),
                  RoundedButton(text: 'Register', press: () {}),
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
