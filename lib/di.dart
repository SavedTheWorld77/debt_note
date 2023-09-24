import 'package:debt_note/src/features/auth/data/data_sources/remote/firebase_auth_service.dart';
import 'package:debt_note/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:debt_note/src/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> inject() async {
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(firebaseAuth: locator()));
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuthService: locator()));
}
