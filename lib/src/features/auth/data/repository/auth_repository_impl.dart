import 'package:dartz/dartz.dart';
import 'package:debt_note/src/features/auth/domain/entities/user.dart';
import 'package:debt_note/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data_sources/remote/firebase_auth_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl({required this.firebaseAuthService});

  @override
  Future<Either<FirebaseAuthException, UserCredential>> login(
      UserLogin user) async {
    final credential = await firebaseAuthService.loginWithEmailAndPassword(
        email: user.email, password: user.password);

    return credential.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> register(
      UserLogin user) async {
    final credential = await firebaseAuthService.registerWithEmailAndPassword(
        email: user.email, password: user.password);

    return credential.fold(
        (exception) => Left(exception), (creds) => Right(creds));
  }

  @override
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
  }
}
