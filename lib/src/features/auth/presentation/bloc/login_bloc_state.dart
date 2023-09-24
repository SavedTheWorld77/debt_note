part of 'login_bloc_bloc.dart';

@immutable
sealed class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

final class LoginBlocSuccess extends LoginBlocState {}

final class LoginBlocError extends LoginBlocState {}
