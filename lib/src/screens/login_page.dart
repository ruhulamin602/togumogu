import 'package:togumogu/src/bloc/form/my_form_bloc.dart';
import 'package:togumogu/src/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:togumogu/src/bloc/login/login_bloc.dart';
import 'package:togumogu/src/screens/login_screen.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return MyFormBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          );
        },
        child: LoginScreen(),
      ),
    );
  }
}
