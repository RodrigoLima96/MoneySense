import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
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
          return const Center(child: LoaderWidget());
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
            const PageTitleWidget(title: 'Sign in'),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                    RoundedButton(
                        text: 'Sign in',
                        press: () async {
                          if (formKey.currentState!.validate()) {
                            await authStore.loginUser(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          }
                        }),
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
