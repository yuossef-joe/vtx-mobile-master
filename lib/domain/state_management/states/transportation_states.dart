
import '../../model/models.dart';
import '../../model/transportation_models.dart';

abstract class TransportationState {}

class TransportationInitial extends TransportationState {}

class TransportationLoading extends TransportationState {}

class TransportationLoaded extends TransportationState {
  final NearByTransportationModel data;
  final CategoryResponseModel category;
  TransportationLoaded(this.data,this.category);
}

class TransportationFilterLoaded extends TransportationState {
  final NearByTransportationModel data;
  TransportationFilterLoaded(this.data);
}

class TransportationError extends TransportationState {
  final String message;

  TransportationError(this.message);
}
