import '../data.dart';

abstract interface class IAuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> loginWithGoogle();

  Future<void> createUserOnDatabase({
    required String id,
    required String name,
    required String email,
  });

  Future<UserModel?> getCurrentUserData();
}
