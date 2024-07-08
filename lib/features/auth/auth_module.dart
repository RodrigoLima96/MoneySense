import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import 'auth.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  
  @override
  void binds(i) {
    // Usecases
    i.add(() => SignUpUserUsecase(authRepository: i()));
    i.add(() => LoginUserWithEmailAndPasswordUsecase(authRepository: i()));
    i.add(() => LoginUserWithGoogleUsecase(authRepository: i()));
    i.add(() => GetCurrentUserUsecase(authRepository: i()));

    // repositories
    i.addLazySingleton<IAuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: i()));

    // datasources
    i.addLazySingleton<IAuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(auth: i(), firestore: i()));

    // store
    i.addLazySingleton(
      () => AuthStore(
        signUpUserUsecase: i(),
        loginUserWithEmailAndPasswordUsecase: i(),
        appUserStore: i(),
        getCurrentUserUsecase: i(),
        loginUserWithGoogleUsecase: i(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child('/welcome', child: (context) => const WelcomePage());
    r.child('/login/', child: (context) => const LoginPage());
    r.child('/register/', child: (context) => const SignUpPage());
  }
}
