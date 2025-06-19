import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/cubit/booking_states.dart';
import 'package:applocation/domain/usecase/booking_usecase.dart';
import 'package:bloc/bloc.dart';


class BookingCubit extends Cubit<BookingState> {
  final BookingUseCase _bookingUseCase;

  BookingCubit(this._bookingUseCase) : super(BookingInitial());

  void fetchBookingData(int placeId) async {
    emit(BookingLoading());
    final result = await _bookingUseCase.execute(placeId);

    result.fold(
      (failure) => emit(BookingError(failure.code)),
      (data) => emit(BookingLoaded(data)),
    );
  }

  void confirmBooking(BookingInput request) async {
    emit(BookingSubmitting());
    final result = await _bookingUseCase.confirmBooking(request);

    result.fold(
      (failure) => emit(BookingError(failure.code)),
      (response) => emit(BookingSuccess(response)),
    );
  }

}
