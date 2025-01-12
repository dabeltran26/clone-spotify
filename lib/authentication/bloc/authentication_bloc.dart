import 'package:bloc/bloc.dart';
import 'package:clone_spotify/authentication/bloc/authentication_event.dart';
import 'package:clone_spotify/authentication/bloc/authentication_state.dart';
import 'package:clone_spotify/authentication/repository/user_repository.dart';
import 'package:clone_spotify/models/user_data_model.dart';
import 'package:hive/hive.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository;
  var usersBox = Hive.box('usersBox');
  late UserData myUser;
  AuthenticationBloc(this._userRepository) : super( Uninitialized() ) {

    on<AppStarted>( (event, emit ) async {
      try{
        final isSignedIn = await _userRepository.isSignedIn();
        if(isSignedIn){
          /*final user = await _userRepository.getUser();
          if(usersBox.get('users') != null){
            myUser = usersBox.get('users');
          }else{
            myUser = await _userRepository.getInfoUser('odraude1362@gmail.com','Jorgito123');
            usersBox.put('users', myUser);
          }*/
          emit(const Authenticated());
        }
        else{
          emit(Unauthenticated());
        }
      }catch(_){
        emit(Unauthenticated());
      }
    });


    on<LoggedIn>( (event, emit ) async {
      final user = await _userRepository.getUser();
      myUser = await _userRepository.getInfoUser('odraude1362@gmail.com','Jorgito123');
      usersBox.put('users', myUser);
      emit(const Authenticated());
    });

    on<LoggedOut>( (event, emit ) async {
      emit(Unauthenticated());
      _userRepository.singOut();
      usersBox.delete('users');
    });

  }

}