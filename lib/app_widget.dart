import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth/welcome');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      routerConfig: Modular.routerConfig,
    );
  }
}
