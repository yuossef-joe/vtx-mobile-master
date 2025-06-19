import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final bool rememberMe;

  LoginButtonPressed(this.username, this.password, this.rememberMe);

  @override
  List<Object?> get props => [username, password, rememberMe];
}

class LoginCheckTokenEvent extends LoginEvent{

}
class LogoutEvent extends LoginEvent{

}

class LoginInputChanged extends LoginEvent {
  final String username;
  final String password;

  LoginInputChanged(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class LoginCheckAuthEvent extends LoginEvent{
  @override
  List<Object?> get props => [];
}