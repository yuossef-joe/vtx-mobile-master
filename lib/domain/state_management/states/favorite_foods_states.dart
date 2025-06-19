import 'package:applocation/domain/model/models.dart';

abstract class FavoriteFoodsState  {
  const FavoriteFoodsState();
  List<Object> get props => [];
}

class FavoriteFoodsInitial extends FavoriteFoodsState {}

class FavoriteFoodsLoading extends FavoriteFoodsState {}

class FavoriteFoodsLoaded extends FavoriteFoodsState {
  final List<PopularPlace> popularFoods;
  final List<TopPlace> topRatedFoods;

  FavoriteFoodsLoaded(
      this.popularFoods,
      this.topRatedFoods,
      );

  @override
  List<Object> get props => [popularFoods, topRatedFoods];
}

class FavoriteFoodsError extends FavoriteFoodsState {
  final String error;

  FavoriteFoodsError(this.error);

  @override
  List<Object> get props => [error];
}
