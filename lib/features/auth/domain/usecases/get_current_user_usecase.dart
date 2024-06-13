
import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetCurrentUserUsecase implements Usecase<UserEntity, NoParams> {
  final IAuthRepository authRepository;

  GetCurrentUserUsecase({required this.authRepository});
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.getCurrentUser();
  }
}