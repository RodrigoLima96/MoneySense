import 'package:flutter_modular/flutter_modular.dart';

import 'auth.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/welcome', child: (context) => const WelcomePage());
    r.child('/login/', child: (context) => const LoginPage());
    r.child('/register/', child: (context) => const SignUpPage());
  }
}
