import 'package:bloc/bloc.dart';
import 'package:clone_spotify/models/playlist_model.dart';
import 'package:clone_spotify/playlist/bloc/playlist_event.dart';
import 'package:clone_spotify/playlist/bloc/playlist_state.dart';
import 'package:clone_spotify/playlist/repository/playlist_repository.dart';
import 'package:hive/hive.dart';

class PlayListBloc extends Bloc<PlayListEvent, PlayListState> {

  final PlayListRepository _playListRepository;

  PlayListBloc(this._playListRepository) : super( Initialized() ) {

    var usersBox = Hive.box('spotify');
    late String token;
    late String tokenType;

    on<Init>( (event, emit ) async {
      token = usersBox.get('accessToken');
      tokenType = usersBox.get('tokenType');
      PlayList playList  = await _playListRepository.fetchPlayLists('CO','$tokenType $token',event.id);
      emit(DataState(playList));
    });
  }
}