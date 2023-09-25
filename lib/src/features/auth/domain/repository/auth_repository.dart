import 'package:dartz/dartz.dart';
import 'package:debt_note/src/features/auth/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<FirebaseAuthException, UserCredential>> login(UserLogin user);

  Future<Either<FirebaseAuthException, UserCredential>> register(
      UserLogin user);

  Future<void> signOut() async {}
}
