import 'package:clone_spotify/authentication/register/bloc/register_bloc.dart';
import 'package:clone_spotify/authentication/repository/user_repository.dart';
import 'package:clone_spotify/authentication/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(_userRepository),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}