import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/register_usecase.dart';
import '../events/register_event.dart';
import '../states/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  Future<void> _onRegisterButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    final result = await _registerUseCase.execute(
      RegisterUseCaseInput(
        event.userName,
        event.email,
        event.password,
        event.phone,
        event.countryCode,
      ),
    );

    result.fold(
          (failure) {
            return emit(RegisterFailure(message: failure.code));},
          (msg) => emit(RegisterSuccess(msg)),
    );
  }
}
