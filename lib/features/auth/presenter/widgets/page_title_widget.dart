import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  const PageTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppPallete.whiteColor,
      ),
    );
  }
}
