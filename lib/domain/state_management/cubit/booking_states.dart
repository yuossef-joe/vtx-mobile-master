import 'package:applocation/domain/model/models.dart';

import '../../model/booking_models.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final OnePlaceResponseModel data;
  BookingLoaded(this.data);
}

class BookingBottomSheet extends BookingState {}

class BookingBottomSheetInput extends BookingState {
  BookingInput input;
  BookingBottomSheetInput(this.input);
}

class BookingSubmitting extends BookingState {}

class BookingSuccess extends BookingState {
  final PlaceBookingModel response;
  BookingSuccess(this.response);
}

class BookingError extends BookingState {
  final String message;
  BookingError(this.message);
}
