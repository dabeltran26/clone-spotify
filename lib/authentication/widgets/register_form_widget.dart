import 'package:clone_spotify/authentication/bloc/authentication_bloc.dart';
import 'package:clone_spotify/authentication/bloc/authentication_event.dart';
import 'package:clone_spotify/authentication/register/bloc/register_bloc.dart';
import 'package:clone_spotify/authentication/register/bloc/register_event.dart';
import 'package:clone_spotify/authentication/register/bloc/register_state.dart';
import 'package:clone_spotify/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {

  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.isSubmitting) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text('Registering'),
                      CircularProgressIndicator()
                    ],
                  ),
                ));
            }
            if (state.isSuccess) {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
              Navigator.of(context).pop();
            }
            if (state.isFailure) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text('Registration Failure'),
                      Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: Colors.red,
                ));
            }
          }, child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final padding = MediaQuery.of(context).size;
          return Padding(
            padding:EdgeInsets.only(top: padding.height*0.2,left: padding.height*0.03,right: padding.height*0.03),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Registrate',
                      style: MyTheme.generalFonts.bold
                          .copyWith(color: MyTheme.generalColors.black, fontSize: 36),
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
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
                  const SizedBox(height: 20,),
                  RaisedButton(
                    child: SizedBox(
                        width: padding.width * 0.5,
                        height: padding.height * 0.06,
                        child: const Center(child: Text('Registrarme'))),
                    color: MyTheme.generalColors.green,
                    textColor: MyTheme.generalColors.white,
                    shape: const StadiumBorder(),
                    onPressed: _onFormSubmitted,
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(Submitted(
        email: _emailController.text, password: _passwordController.text));
  }
}
