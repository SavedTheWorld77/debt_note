import 'package:debt_note/di.dart';
import 'package:debt_note/src/features/auth/domain/entities/user.dart';
import 'package:debt_note/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:debt_note/src/features/auth/presentation/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  LoginBloc loginBloc = locator<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => loginBloc,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 0.05 * MediaQuery.of(context).size.height),
                const DebtNoteTitle()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
