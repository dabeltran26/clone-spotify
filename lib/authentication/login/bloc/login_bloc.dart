import 'package:bloc/bloc.dart';
import 'package:clone_spotify/authentication/login/bloc/login_event.dart';
import 'package:clone_spotify/authentication/login/bloc/login_state.dart';
import 'package:clone_spotify/authentication/repository/user_repository.dart';
import 'package:clone_spotify/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {

  final UserRepository _userRepository;
  LoginBloc(this._userRepository) : super( LoginState.empty() ) {

    on<EmailChanged>( (event, emit ) async {
      emit(state.update(isEmailValid: Validators.isValidEmail(event.email)
      ));
    });


    on<PasswordChanged>( (event, emit ) async {
      emit(state.update(isPasswordValid: Validators.isValidPassword(event.password)));
    });

    on<LoginWithCredentials>( (event, emit ) async {
      emit(LoginState.loading());
      try{
        await _userRepository.signInWithCredentials(event.email, event.password);
        emit(LoginState.success());
      }catch(_){
        emit(LoginState.failure());
      }
    });

  }

}