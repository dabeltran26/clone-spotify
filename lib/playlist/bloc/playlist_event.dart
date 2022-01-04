import 'package:flutter/material.dart';

@immutable
abstract class PlayListEvent {}

class Init extends PlayListEvent{
  final String id;
  Init(this.id);
}

class GetTacks extends PlayListEvent{
  final String playListId;
  GetTacks( this.playListId);

  @override
  List<Object> get props => [];
}
