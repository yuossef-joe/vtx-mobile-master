import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_usecase/login_usecase.dart';
import '../events/login_events.dart';
import '../states/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginCheckAuthEvent>(_onLoginAuthCheck);
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LoginInputChanged>(_onInputChanged);
    on<LoginCheckTokenEvent>(_onCheckToken);
    on<LogoutEvent>(_logout);
  }

  void _onCheckToken(LoginCheckTokenEvent event,Emitter<LoginState> emit){
    emit(LoginCheckAuth());
  }

  Future<void> _onLoginAuthCheck(
      LoginCheckAuthEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginUseCase.checkAuth();
    result.fold(
      (failure) => emit(LoginCheckAuthFailure()),
      (data) => emit(LoginCheckAuthSuccess()),
    );
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await loginUseCase.execute(
      LoginUseCaseInput(event.username, event.password, event.rememberMe),
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.code)),
      (data) => emit(LoginSuccess(data)),
    );
  }
  void _logout(LogoutEvent event, Emitter<LoginState> emit) {
    emit(LoginInitial());
  }

  void _onInputChanged(LoginInputChanged event, Emitter<LoginState> emit) {
    if (event.username.isNotEmpty && event.password.length > 7) {
      emit(LoginValidInput()); // Valid input state
    } else {
      emit(LoginInvalidInput()); // Invalid input state
    }
  }
}


// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class StateRendererBloc extends Bloc<StateRendererEvent, StateRendererState> {
//   StateRendererBloc() : super(ContentState()) {
//     on<LoadDataEvent>((event, emit) {
//       emit(LoadingState(type: StateRendererType.fullScreenLoadingState));
//     });
//
//     on<ShowErrorEvent>((event, emit) {
//       emit(ErrorState(type: StateRendererType.popupErrorState, message: event.message));
//     });
//
//     on<ShowSuccessEvent>((event, emit) {
//       emit(SuccessState(message: event.message));
//     });
//
//     on<ShowEmptyEvent>((event, emit) {
//       emit(EmptyState());
//     });
//   }
// }
