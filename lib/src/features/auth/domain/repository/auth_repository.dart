import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<FirebaseAuthException, UserCredential>> login(
      String email, String password);

  Future<Either<FirebaseAuthException, UserCredential>> register(
      String email, String password);

  Future<void> signOut() async {}
}
