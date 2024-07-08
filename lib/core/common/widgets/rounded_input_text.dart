import 'package:flutter/material.dart';
import '../../core.dart';

class RoundedInputText extends StatefulWidget {
  final String inputTitle;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  const RoundedInputText({
    super.key,
    required this.inputTitle,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    required this.controller,
  });

  @override
  State<RoundedInputText> createState() => _RoundedInputTextState();
}

class _RoundedInputTextState extends State<RoundedInputText> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.inputTitle),
        const SizedBox(height: 15),
        TextFormField(
          style: const TextStyle(color: AppPallete.whiteColor),
          obscureText: widget.isPassword ? _obscureText : false,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppPallete.primaryColor,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppPallete.greyColor),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppPallete.greyColor,
                    ),
                    onPressed: _toggleVisibility,
                  )
                : null,
          ),
          validator: (value) {
            if (value!.trim().isEmpty) {
              return widget.hintText;
            }
            if (value.trim().length < 6 && widget.isPassword) {
              return 'Password: min 6 characters';
            }
            if (widget.isEmail) {
              String pattern = r'^[^@]+@[^@]+\.[^@]+';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
