import 'package:equatable/equatable.dart';
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class LoadHomeDataEvent extends HomeEvent {
   final String destination;
   const LoadHomeDataEvent(this.destination);

}

class HomeSelectDestination extends HomeEvent {}

class LoadNearByDataEvent extends HomeEvent{
  final double lat;
  final double lon;
  final double radius;
  final String type;

  const LoadNearByDataEvent(
      this.lat,this.lon,this.radius,this.type
      );

  @override
  List<Object?> get props => [lat,lon,radius,type];
}

class InitialEvent extends HomeEvent {}

class HomeContentEvent extends HomeEvent {}

class HomeDestinationEvent extends HomeEvent {}