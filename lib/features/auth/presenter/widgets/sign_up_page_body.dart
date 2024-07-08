import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final authStore = Modular.get<AuthStore>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PageTitleWidget(title: 'Register'),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
          const SizedBox(height: 50),
          GoogleWidget(press: () {}, welcomePage: false),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
