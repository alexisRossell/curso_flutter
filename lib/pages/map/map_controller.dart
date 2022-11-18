import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as location;
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class MapController with ChangeNotifier {
  CameraPosition initialPosition = const CameraPosition(
    target: LatLng(
      19.702588082124645,
      -101.19231174615162,
    ),
    zoom: 14.0,
  );
  GoogleMapController? googleMapController;
  final Completer<GoogleMapController> _onMapCreatedCompleter = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position? _position;

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(
      '[{"featureType": "administrative","elementType": "geometry","stylers": [{"visibility": "off"}]},{"featureType": "poi","stylers": [{"visibility": "off"}]},{"featureType": "road","elementType": "labels.icon","stylers": [{"visibility": "off"}]},{"featureType": "transit","stylers": [{"visibility": "off"}]}]',
    );

    _onMapCreatedCompleter.complete(controller);
  }

  Future animateCameraToPosition(double latitude, double longitude) async {
    googleMapController = await _onMapCreatedCompleter.future;

    if (googleMapController != null) {
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              bearing: 0,
              target: LatLng(
                latitude,
                longitude,
              ),
              zoom: 15),
        ),
      );
    }
  }

  void centerPosition() {
    if (_position != null) {
      animateCameraToPosition(
          _position?.latitude ?? 0, _position?.longitude ?? 0);
    }
  }

  Future<Position> _determinePosition() async {
    developer.log('determinePosition', name: 'map_controller');
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      developer.log('Error: Location services are not enabled',
          name: 'map_controller');
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      developer.log('Error: denied if1', name: 'map_controller');
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        developer.log('Error: denied if2', name: 'map_controller');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        developer.log('Error: denied if3', name: 'map_controller');
        return Future.error('Location permissions are denied');
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    developer.log('Successful: Return CurrentPosition',
        name: 'map_controller');
    return await Geolocator.getCurrentPosition();
  }

  void updateLocation() async {
    try {
      await _determinePosition();
      //In this case, we get the location only occasion
      _position = await Geolocator.getLastKnownPosition();
      centerPosition();
    } catch (error) {
      developer.log('updateLocation_error', name: 'map_controller');
    }
  }

  void checkGPS() async {
    developer.log('checkGPS', name: 'map_controller');
    bool isLocationEnable = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnable) {
      // print('GPS ACTIVADO');
      updateLocation();
      /*checkIfIsConnect();*/
    } else {
      ///If it is deactivated, it shows a dialog where it asks the user to activate it
      // print('GPS DESACTIVADO');
      bool locationGPS = await location.Location().requestService();
      if (locationGPS) {
        updateLocation();
        /*checkIfIsConnect();*/
        // print('GPS ACTIVADO');
      }
    }
  }

  void addMarker(String markerId, double lat, double lng, String title,
      String content, BitmapDescriptor iconMarker) {
    try {
      MarkerId id = MarkerId(markerId);
      Marker marker = Marker(
          markerId: id,
          icon: iconMarker,
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: title),
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: const Offset(0.5, 0.5),
          rotation: _position?.heading ?? 0);

      markers[id] = marker;
    } catch (error) {
      developer.log('addMarker_error', name: 'map_controller');
    }
  }

}
