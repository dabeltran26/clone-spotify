import 'package:clone_spotify/models/categories_model.dart';
import 'package:clone_spotify/models/playlist_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PlayListState {
  const PlayListState();

  @override
  List<Object> get props => [];
}

class Initialized extends PlayListState{
  @override
  String toString() => 'Init';
}

class DataState extends PlayListState{
  final PlayList playList;
  DataState(this.playList);
}


