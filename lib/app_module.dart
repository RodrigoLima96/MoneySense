import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth.dart';
import 'features/home/home_module.dart';
import 'features/home/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/auth', module: AuthModule());
    r.module('/home/', module: HomeModule());

  }
}