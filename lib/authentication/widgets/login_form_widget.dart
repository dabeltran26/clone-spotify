import 'package:clone_spotify/authentication/bloc/authentication_bloc.dart';
import 'package:clone_spotify/authentication/bloc/authentication_event.dart';
import 'package:clone_spotify/authentication/login/bloc/login_bloc.dart';
import 'package:clone_spotify/authentication/login/bloc/login_event.dart';
import 'package:clone_spotify/authentication/login/bloc/login_state.dart';
import 'package:clone_spotify/authentication/register/register_page.dart';
import 'package:clone_spotify/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isFailure) {
        print('Error');
      }
      if (state.isSubmitting) {
        const CircularProgressIndicator();
      }
      if (state.isSuccess) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
      }
    }
        , child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final padding = MediaQuery.of(context).size;
            return Padding(
              padding: EdgeInsets.only(top: padding.height * 0.2,left: padding.height * 0.03, right: padding.height * 0.03),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Iniciar sesion',
                        style: MyTheme.generalFonts.bold
                            .copyWith(color: Colors.black, fontSize: 36),
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email), labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isEmailValid ? 'Invalid Email' : null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock), labelText: 'Password'),
                      obscureText: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isPasswordValid ? 'Invalid Password' : null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          GestureDetector(
                              child: SizedBox(
                                  width: padding.width * 0.5,
                                  height: padding.height * 0.06,
                                  child: const Center(child: Text('Iniciar sesion'))),
                              onTap: _onFormSubmitted),
                          GestureDetector(
                            child: const Text('regitrate'),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              }));
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentials(
        email: _emailController.text, password: _passwordController.text));
  }
}
