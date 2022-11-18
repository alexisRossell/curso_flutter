import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:curso/pages/map/map_controller.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapController(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
        child: Scaffold(
          body: SafeArea(
            child: Consumer<MapController>(
              builder: (context, mapController, widget) => GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: mapController.initialPosition,
                onMapCreated: mapController.onMapCreated,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                markers: Set<Marker>.of(mapController.markers.values),
                onCameraMove: (position) {
                  mapController.initialPosition = position;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
