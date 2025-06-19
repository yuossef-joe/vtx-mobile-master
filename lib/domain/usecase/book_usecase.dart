import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../model/booking_models.dart';
import '../model/models.dart';
import '../repository/repository.dart';

class BookingUseCase {
  final Repository _repository;

  BookingUseCase(this._repository);

  Future<Either<Failure, PlaceBookingModel>> confirmBooking(BookingInput input) async {
    return await _repository.confirmBooking(input);
  }

  Future<Either<Failure, Register>> updateBooking(BookingInput input) async {
    return await _repository.updateBooking(input);
  }

   Future<Either<Failure, BookingResponse>> getUserBooking(String type) async {
    return await _repository.getUserBooking(type);
  }

  Future<Either<Failure, Register>> cancelBooking(String bookId) async {
    return await _repository.cancelBooking(bookId);
  }


}

