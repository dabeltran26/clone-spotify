import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class Init extends HomeEvent{
  Init();
}

class UpdateEvent extends HomeEvent{
  final String text;
  UpdateEvent( this.text);

  @override
  List<Object> get props => [];
}
