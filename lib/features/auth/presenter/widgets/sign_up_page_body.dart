import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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
      child: Observer(builder: (_) {
        if (authStore.authState == AuthState.loading) {
          return const LoaderWidget();
        }

        reaction((_) => authStore.authState, (AuthState state) {
          if (state == AuthState.success) {
            Modular.to.navigate('/home/');
          }
        });

        reaction((_) => authStore.authState, (AuthState state) {
          if (state == AuthState.failure) {
            showCustomSnackbar(context, authStore.authFailureMessage);
          }
        });

        return Column(
          children: [
            const PageTitleWidget(title: 'Register'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    RoundedInputText(
                      inputTitle: 'Name',
                      hintText: 'Enter your name',
                      isPassword: false,
                      isEmail: false,
                      controller: nameController,
                    ),
                    const SizedBox(height: 30),
                    RoundedInputText(
                      inputTitle: 'Email',
                      hintText: 'Enter your email',
                      isPassword: false,
                      isEmail: true,
                      controller: emailController,
                    ),
                    const SizedBox(height: 30),
                    RoundedInputText(
                      inputTitle: 'Password',
                      hintText: 'Enter password',
                      isPassword: true,
                      isEmail: false,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 70),
                    RoundedButton(
                      text: 'Register',
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          await authStore.signUpUserWithEmailAndPassword(
                            name: nameController.text,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            GoogleWidget(press: () {}, welcomePage: false),
            const SizedBox(height: 30),
          ],
        );
      }),
    );
  }
}
