import 'package:applocation/domain/model/models.dart';

abstract class PlaceFilterState {}

class PlaceFilterInitial extends PlaceFilterState {}

class PlaceFilterLoading extends PlaceFilterState {}

class PlaceFilterLoaded extends PlaceFilterState {
  final List<PopularPlace> filtered;

  PlaceFilterLoaded(this.filtered);
}

class PlaceFilterError extends PlaceFilterState {
  final String message;

  PlaceFilterError(this.message);
}
