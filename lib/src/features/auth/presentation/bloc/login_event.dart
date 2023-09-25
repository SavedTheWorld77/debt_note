part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class Login extends LoginEvent {
  final UserLogin user;
  Login({required this.user});
}

final class LoginTest extends LoginEvent {}

final class LoginTest1 extends LoginEvent {}
