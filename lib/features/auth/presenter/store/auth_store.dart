// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

enum AuthState { notStarted, loading, failure, success }

abstract class _AuthStoreBase with Store {
  final SignUpUserUsecase signUpUserUsecase;
  final LoginUserWithEmailAndPasswordUsecase
      loginUserWithEmailAndPasswordUsecase;
  final LoginUserWithGoogleUsecase loginUserWithGoogleUsecase;

  final GetCurrentUserUsecase getCurrentUserUsecase;
  final AppUserStore appUserStore;

  @observable
  AuthState authState = AuthState.notStarted;

  String authFailureMessage = '';

  _AuthStoreBase({
    required this.signUpUserUsecase,
    required this.loginUserWithEmailAndPasswordUsecase,
    required this.loginUserWithGoogleUsecase,
    required this.getCurrentUserUsecase,
    required this.appUserStore,
  });

  @action
  Future<void> signUpUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    await _performAuthAction(
      () => signUpUserUsecase(
        UserSignUpParams(name: name, email: email, password: password),
      ),
    );
  }

  @action
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    await _performAuthAction(
      () => loginUserWithEmailAndPasswordUsecase(
        UserLoginParams(email: email, password: password),
      ),
    );
  }

  @action
  Future<void> checkCurrentUserLoggedIn() async {
    await _performAuthAction(
      () => getCurrentUserUsecase(NoParams()),
    );
  }

  @action
  Future<void> _performAuthAction(
      Future<Either<Failure, UserEntity>> Function() action) async {
    authState = AuthState.loading;
    final result = await action();
    result.fold(
      (failure) {
        authFailureMessage = failure.message;
        authState = AuthState.failure;
      },
      (user) {
        appUserStore.updateUser(userEntity: user);
        authState = AuthState.success;
      },
    );
  }
}
