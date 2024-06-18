import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final user = await _getUser(
      () async => await remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
    user.fold(
      (failure) {
        return left(Failure(failure.message));
      },
      (user) async {
        await remoteDataSource.createUserOnDatabase(
          id: user.id,
          email: user.email,
          name: user.name,
        );
      },
    );

    return user;
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    return _getUser(
      () async => await remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await remoteDataSource.loginWithGoogle();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure('User not Logged in!'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, UserEntity>> _getUser(
    Future<UserEntity> Function() function,
  ) async {
    try {
      final user = await function();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
