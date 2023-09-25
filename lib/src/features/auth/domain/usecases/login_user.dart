import 'package:dartz/dartz.dart';
import 'package:debt_note/src/core/usecase/usecase.dart';
import 'package:debt_note/src/features/auth/domain/entities/user.dart';
import 'package:debt_note/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUserUseCase implements UseCase<UserCredential, UserLogin> {
  final AuthRepository _authRepository;

  LoginUserUseCase(this._authRepository);

  @override
  Future<Either<Exception, UserCredential>> call({required UserLogin params}) {
    return _authRepository.login(params);
  }
}
