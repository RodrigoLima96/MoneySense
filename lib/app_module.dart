import 'package:flutter_modular/flutter_modular.dart';

import 'features/auth/auth.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/auth', module: AuthModule());
  }
}
