import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../states/location_states.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  Position? _position;
  String? _country;

  void ctry(String value)=>_country = value;

  String? get country => _country;

  void pos(Position value)=>_position = value;

  Position? get position => _position;
  Future<void> getLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
    }else{
      if(position!=null){
        emit(LocationLoaded(position: position!));
        return;
      }
    }
    bool isGranted = await _handleLocationPermission();
    if (isGranted) {
      emit(LocationLoading());
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
        pos(position);
        ctry(placeMarks[0].country??'');
        emit(LocationLoaded(position: position));
      } catch (e) {
        emit(LocationError(error: e.toString()));
      }
    } else {
      emit(LocationPermissionDenied());
    }
  }

  Future<bool> _handleLocationPermission() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission == PermissionStatus.granted) {
      return true;
    } else {
      if (permission == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
      return false;
    }
  }

  void errorEmitter(String error) {
    emit(LocationError(error: error));
  }

  void initial() {
    emit(LocationInitial());
  }

  Future<bool> get isLocationServiceEnabled async => await Geolocator.isLocationServiceEnabled();
}
