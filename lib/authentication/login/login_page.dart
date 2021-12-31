import 'package:clone_spotify/authentication/repository/user_repository.dart';
import 'package:clone_spotify/authentication/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {

  final UserRepository _userRepository = UserRepository();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(_userRepository),
        child: const LoginForm(),
      ),
    );
  }
}