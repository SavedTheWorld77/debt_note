import 'package:debt_note/di.dart';
import 'package:debt_note/src/features/auth/domain/entities/user.dart';
import 'package:debt_note/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  LoginBloc loginBloc = locator<LoginBloc>();
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
                loginBloc.add(Login(
                    user: UserLogin(
                        email: "rhen.noriega7@gmail.com",
                        password: "password")));
              }),
              FloatingActionButton(onPressed: () {
                loginBloc.add(LoginTest());
              }),
              FloatingActionButton(onPressed: () {
                // loginBloc.add(LoginTest1());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
