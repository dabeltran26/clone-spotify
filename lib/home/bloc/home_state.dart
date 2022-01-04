import 'package:clone_spotify/models/categories_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeState {
  const HomeState();

  @override
  List<Object> get props => [];
}

class Initialized extends HomeState{
  @override
  String toString() => 'Init';
}

class DataState extends HomeState{
  final Categories categories;
  DataState(this.categories );
}


