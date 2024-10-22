import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clone_spotify/home/bloc/home_event.dart';
import 'package:clone_spotify/home/bloc/home_state.dart';
import 'package:clone_spotify/home/repository/home_repository.dart';
import 'package:clone_spotify/models/authorization_model.dart';
import 'package:clone_spotify/models/categories_model.dart';
import 'package:hive/hive.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final HomeRepository _homeRepository;
  var usersBox = Hive.box('spotify');
  late String token;
  late String tokenType;
  late String refreshToken;
  late Categories categories;
  late Timer refreshTime;

  HomeBloc(this._homeRepository) : super( Initialized() ) {

    on<Init>( (event, emit ) async {
      try {
        if (usersBox.get('accessToken') != null &&
            usersBox.get('tokenType') != null) {
          token = usersBox.get('accessToken');
          tokenType = usersBox.get('tokenType');
          refreshToken = usersBox.get('refreshToken');
        } else {
          String code = await _homeRepository.fetchCode();
          AuthorizationModel accessToken = await _homeRepository
              .getAccessTokenSpotify(code);
          token = accessToken.accessToken;
          tokenType = accessToken.tokenType;
          refreshToken = accessToken.refreshToken;
          usersBox.put('accessToken', token);
          usersBox.put('tokenType', tokenType);
          usersBox.put('refreshToken', refreshToken);
        }
        refreshTime = Timer.periodic(const Duration(minutes: 30), (timer) {
          _homeRepository.refreshToken();
        });
      }catch(e){
        String code = await _homeRepository.fetchCode();
        AuthorizationModel accessToken = await _homeRepository
            .getAccessTokenSpotify(code);
        token = accessToken.accessToken;
        tokenType = accessToken.tokenType;
        refreshToken = accessToken.refreshToken;
        usersBox.put('accessToken', token);
        usersBox.put('tokenType', tokenType);
        usersBox.put('refreshToken', refreshToken);
        _homeRepository.refreshToken();
      }
        categories = await _homeRepository.fetchCategories('CO', '$tokenType $token');

        emit(DataState(categories));

    });
  }
}