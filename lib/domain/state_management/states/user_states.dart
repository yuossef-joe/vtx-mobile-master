

import '../../model/models.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserApi userResponse;

  UserSuccess(this.userResponse);
}

class UserFailure extends UserState {
  final String error;

  UserFailure(this.error);
}
