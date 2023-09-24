part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocEvent {}

final class Login extends LoginBlocEvent {}

final class LoginTest extends LoginBlocEvent {}

final class LoginTest1 extends LoginBlocEvent {}
