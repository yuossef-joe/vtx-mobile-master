
import 'package:applocation/domain/model/models.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeChoosingDestinationState extends HomeState {}

class HomeContentState extends HomeState {}

class NearByLoadingState extends HomeState {}

class HomeLoadedDestinationState extends HomeState{
  final HomeDestinationData destinationData;

  const HomeLoadedDestinationState(this.destinationData);

  @override
  List<Object?> get props => [destinationData];
}

class HomeLoadedState extends HomeState {
  final HomeData homeData;

  const HomeLoadedState(this.homeData);

  @override
  List<Object?> get props => [homeData];
}
class NearByLoadedState extends HomeState {
  final NearBy near;

  const NearByLoadedState(this.near);

  @override
  List<NearBy?> get props => [near];
}
class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class NearByErrorState extends HomeState {
  final String error;

  const NearByErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
