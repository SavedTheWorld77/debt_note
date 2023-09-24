import 'package:debt_note/src/features/auth/presentation/bloc/login_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  LoginBlocBloc loginBloc = LoginBlocBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (BuildContext context) => loginBloc,
        child: SafeArea(
          child: Column(
            children: [
              FloatingActionButton(onPressed: () {
                loginBloc.add(Login());
              }),
              FloatingActionButton(onPressed: () {
                loginBloc.add(LoginTest());
              }),
              FloatingActionButton(onPressed: () {
                loginBloc.add(LoginTest1());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
