import 'package:equatable/equatable.dart';

import '../../model/models.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}
class LoginCheckAuth extends LoginState {}

class LoginCheckAuthSuccess extends LoginState {}

class LoginCheckAuthFailure extends LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Authentication auth;
  LoginSuccess(this.auth);
  @override
  List<Object?> get props => [auth];
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginValidInput extends LoginState {}

class LoginInvalidInput extends LoginState {}
