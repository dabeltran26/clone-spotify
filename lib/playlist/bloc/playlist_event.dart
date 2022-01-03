import 'package:flutter/material.dart';

@immutable
abstract class PlayListEvent {}

class Init extends PlayListEvent{
  final String id;
  Init(this.id);
}

class UpdateEvent extends PlayListEvent{
  final String text;
  UpdateEvent( this.text);

  @override
  List<Object> get props => [];
}
