import 'package:applocation/domain/model/models.dart';

abstract class PlaceProfileState {}

class PlaceProfileInitial extends PlaceProfileState {}

class PlaceProfileLoading extends PlaceProfileState {}

class PlaceProfileLoaded extends PlaceProfileState {
  final PlaceProfileModel profile;

  PlaceProfileLoaded(this.profile);
}

class PlaceProfileError extends PlaceProfileState {
  final String message;

  PlaceProfileError(this.message);
}
