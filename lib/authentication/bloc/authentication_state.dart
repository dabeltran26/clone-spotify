import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState{
  @override
  String toString() => 'No inicializado';
}

class Authenticated extends AuthenticationState{
  const Authenticated();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'autenticado';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'No autenticado';
}
