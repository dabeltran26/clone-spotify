import 'package:clone_spotify/authentication/bloc/authentication_bloc.dart';
import 'package:clone_spotify/authentication/bloc/authentication_event.dart';
import 'package:clone_spotify/authentication/bloc/authentication_state.dart';
import 'package:clone_spotify/authentication/login/login_page.dart';
import 'package:clone_spotify/authentication/repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AuthenticationBloc(userRepository)..add(AppStarted())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'book app',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: ( _ , state) {
          if (state is Uninitialized) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is Authenticated) {
            return const HomePage();
          }
          if (state is Unauthenticated) {
            return LoginPage();
          }
          return Container();
        },
      ),
    );
  }
}
