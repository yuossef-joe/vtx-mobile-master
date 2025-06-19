import 'package:applocation/domain/model/transportation_models.dart';
import 'package:applocation/domain/state_management/bloc/login_bloc.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/transportation/view/transportation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/constants/widgets.dart';

class CategoryNearbyTransportationScreen extends StatefulWidget {
  final Position pos;
  final List<Transportation> trans;
  const CategoryNearbyTransportationScreen(this.pos,this.trans,{super.key});
  @override
  State<CategoryNearbyTransportationScreen> createState() => _CategoryNearbyTransportationScreenState();
}

class _CategoryNearbyTransportationScreenState extends State<CategoryNearbyTransportationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themes = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _getContent(size,themes),
    );
  }

  List<Marker> _markers(List<Transportation> trans)=>trans.map((tran)=>Marker(
      point: LatLng(double.parse(tran.latitude), double.parse(tran.longitude)),
      width: 80,
      height: 80,
      child: Icon(Icons.location_pin, color: Colors.red, size: 40))).cast<Marker>().toList();

  Stack _getContent(Size size,TextTheme themes)=>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(widget.pos.latitude, widget.pos.longitude), // Center of the map (latitude, longitude)
          initialZoom: 16.0,                  // Initial zoom level
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _markers(widget.trans),
          ),
        ],
      ),
      defaultContainer(height: size.height*0.57,color: ColorManager.white,child: buildNearestTransportationSection(size,themes,widget.trans)),
    ],
  );
}
