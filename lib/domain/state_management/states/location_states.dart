
import 'package:geolocator/geolocator.dart';

abstract class LocationState  {
  const LocationState();
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Position position;

  const LocationLoaded({required this.position});

  @override
  List<Object> get props => [position];
}

class LocationError extends LocationState {
  final String error;

  const LocationError({required this.error});

  @override
  List<Object> get props => [error];
}

class LocationPermissionDenied extends LocationState {}

class LocationServiceDisabled extends LocationState {}
