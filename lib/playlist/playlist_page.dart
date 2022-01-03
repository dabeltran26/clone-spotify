import 'package:clone_spotify/models/categories_model.dart';
import 'package:clone_spotify/playlist/bloc/playlist_bloc.dart';
import 'package:clone_spotify/playlist/bloc/playlist_event.dart';
import 'package:clone_spotify/playlist/bloc/playlist_state.dart';
import 'package:clone_spotify/playlist/repository/playlist_repository.dart';
import 'package:clone_spotify/playlist/widgets/play_list_card.dart';
import 'package:clone_spotify/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayList extends StatefulWidget {
  final Item item;
  const PlayList( {Key? key, required this.item}) : super(key: key);

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  PlayListRepository playListRepository = PlayListRepository();
  late PlayListBloc? homeBloc;

  @override
  void initState() {
    homeBloc = PlayListBloc(playListRepository)..add(Init(widget.item.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size padding = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.generalColors.black,
        title: Text(widget.item.name),
      ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [MyTheme.generalColors.purple,MyTheme.generalColors.black],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: const [0.0,1.0],
                tileMode: TileMode.clamp
            ),
          ),
          child: BlocBuilder(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is DataState) {
                return Stack(children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                              itemCount: state.playList.playlists.items.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: (){

                                  },
                                  child: PlayListCard(
                                    item: state.playList.playlists.items[index],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  state.playList.playlists.items.isEmpty
                      ? Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Text(
                      "No hay coincidencias.",
                      style: TextStyle(color: MyTheme.generalColors.black),
                      textAlign: TextAlign.center,
                    ),
                  )
                      : const SizedBox(),
                ]);
              }

              return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MyTheme.generalColors.green,
                  ));
            },
          ),
        ));
  }
}
