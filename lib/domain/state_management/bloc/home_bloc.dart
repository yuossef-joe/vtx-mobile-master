import 'package:bloc/bloc.dart';
import 'package:applocation/domain/model/models.dart';
import '../../../../../domain/usecase/home_usecase.dart';
import '../../../app/constants.dart';
import '../events/home_event.dart';
import '../states/home_states.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _homeUseCase;
  HomeBloc(this._homeUseCase) : super(HomeInitial()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
    on<LoadNearByDataEvent>(_onLoadNearByPlaces);
    on<HomeContentEvent>(_onContent);
    on<HomeSelectDestination>(_onHomeSelectDestination);
  }

  bool _HomeCanPop=false;

  bool get canPop =>_HomeCanPop;

  set canPopToggle(bool pop)=>_HomeCanPop=pop;

  Future<void> _onHomeSelectDestination( HomeSelectDestination event, Emitter<HomeState> emit)async{
    emit(HomeLoadingState());
    final result = await _homeUseCase.getDestination();

    result.fold(
          (failure) {
        emit(HomeErrorState(failure.code));
      },
          (response) {
        Constants.countries = response.destinations!.data!.countries!.map((country)=>country.name).toList();
        emit(HomeLoadedDestinationState(response));
      },
    );
  }

  Future<void> _onLoadHomeData(
      LoadHomeDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final result = await _homeUseCase.execute(event.destination);
    result.fold(
          (failure) {
        emit(HomeErrorState(failure.code));
      },
          (homeObject) {
        final homeData = HomeData(
          homeObject.data.categories,
          homeObject.data.famousPlaces,
          homeObject.data.recommendedPlaces,
        );
        emit(HomeLoadedState(homeData));
      },
    );
  }

  void _onContent(HomeContentEvent event,Emitter<HomeState> emit)
  {
    emit(HomeContentState());
  }

  Future<void> _onLoadNearByPlaces(
      LoadNearByDataEvent event, Emitter<HomeState> emit) async {
    emit(NearByLoadingState());
    final result = await _homeUseCase.getNearBy(NearByParameters(event.lat, event.lon, event.radius, event.type));
    result.fold(
          (failure) {
        emit(NearByErrorState(failure.code));
      },
          (data) {
        emit(NearByLoadedState(NearBy(data.nearBy)));
      },
    );
  }
}
