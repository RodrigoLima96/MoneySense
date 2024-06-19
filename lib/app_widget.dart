import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/auth/presenter/pages/pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const   WelcomePage(),
    );
  }
}
