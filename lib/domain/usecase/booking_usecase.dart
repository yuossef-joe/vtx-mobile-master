import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../model/booking_models.dart';
import '../model/models.dart';
import '../repository/repository.dart';

class BookingUseCase implements BaseUsecase<int, OnePlaceResponseModel> {
  final Repository _repository;

  BookingUseCase(this._repository);

  @override
  Future<Either<Failure, OnePlaceResponseModel>> execute(int placeId) async {
    return await _repository.getOnePlace(placeId);
  }

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

  // Future<Either<Failure, BookingResponse>> bookNow(BookingRequest request) async {
  //   return await _repository.postBooking(request);
  // }
}
