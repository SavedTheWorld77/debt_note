import 'package:debt_note/src/features/auth/data/data_sources/remote/firebase_auth_service.dart';
import 'package:debt_note/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:debt_note/src/features/auth/domain/repository/auth_repository.dart';
import 'package:debt_note/src/features/auth/domain/usecases/login_user.dart';
import 'package:debt_note/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:debt_note/src/features/manage_debt/data/data_sources/remote/manage_debt_service.dart';
import 'package:debt_note/src/features/manage_debt/data/repository/debt_repository_impl.dart';
import 'package:debt_note/src/features/manage_debt/domain/repository/debt_repository.dart';
import 'package:debt_note/src/features/manage_debt/domain/usecases/get_debts.dart';
import 'package:debt_note/src/features/manage_debt/presentation/bloc/bloc/homepage_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> inject() async {
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(firebaseAuth: locator()));
  locator.registerLazySingleton<ManageDebtService>(() => ManageDebtService());
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuthService: locator()));
  locator.registerLazySingleton<DebtRepository>(
      () => DebtRepositoryImpl(manageDebtService: locator()));
  locator.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(locator()));
  locator
      .registerLazySingleton<GetDebtsUseCase>(() => GetDebtsUseCase(locator()));

  locator.registerFactory<LoginBloc>(() => LoginBloc(locator()));
  locator.registerFactory<HomepageBloc>(() => HomepageBloc(locator()));
}
