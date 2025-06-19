import 'package:applocation/domain/model/models.dart';
import 'package:bloc/bloc.dart';

import '../../usecase/FavoriteFoodsUseCase.dart';
import '../states/favorite_foods_states.dart';

class FavoriteFoodsCubit extends Cubit<FavoriteFoodsState> {
  final FavoriteFoodsUseCase _favoriteFoodsUseCase;

  FavoriteFoodsCubit(this._favoriteFoodsUseCase) : super(FavoriteFoodsInitial());
    PopularPlacesApiModel? _res;
    TopPlacesApiModel? _resTop;
  // Fetch Popular Foods
  void fetchFavoriteFoods(int page,String type,String country) async {
    emit(FavoriteFoodsLoading());
    final result = await _favoriteFoodsUseCase.getPopularPlaces(page,country);
    final resultTop = await _favoriteFoodsUseCase.getTopRatedFoods(type,country);
   
    resultTop.fold(
          (failure) {
            emit(FavoriteFoodsError('${failure.code} top rated'));
            return;
          },
          (topRatedFoods) =>   _resTop=topRatedFoods
    );
    result.fold(
          (failure)  {
            emit(FavoriteFoodsError('${failure.code} popular'));
            return;
          },
          (popularFoods) => _res = popularFoods
    );
    emit(FavoriteFoodsLoaded(_res!.data!.nest!.data, _resTop!.data!.nest!.data));
  }

  // Fetch Top Rated Foods

}