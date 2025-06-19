import 'dart:ffi';

import 'package:bloc/bloc.dart';

import '../../usecase/user_usecase.dart';
import '../states/user_states.dart';


class UserCubit extends Cubit<UserState> {
  final UserUseCase _userUseCase;

  UserCubit(this._userUseCase) : super(UserInitial());

  Future<void> fetchUserData() async {
    emit(UserLoading());
    try {
      final response = await _userUseCase.execute(Void);

      response.fold(
            (failure) => emit(UserFailure(failure.code)),
            (profile) => emit(UserSuccess(profile))
      );

    } catch (e) {
    }
  }
}