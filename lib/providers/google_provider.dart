import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:curso/models/direction_model.dart';

class GoogleProvider {

  ///Config the directions service of google.
  ///Receives:double fromLat, double fromLng, double toLat, double toLng
  ///Returns: Future<dynamic>
  Future<dynamic> getGoogleMapsDirections(
      double fromLat, double fromLng, double toLat, double toLng) async {

    Uri uri = Uri.https('maps.googleapis.com', 'maps/api/directions/json', {
      'key': "apiKeyMaps",
      'origin': '$fromLat,$fromLng',
      'destination': '$toLat,$toLng',
      'traffic_model': 'best_guess',
      'departure_time': DateTime.now().microsecondsSinceEpoch.toString(),
      'mode': 'driving',
      'transit_routing_preferences': 'less_driving'
    });
    developer.log('URL: $uri', name: 'google_providers');
    final response = await http.get(uri);
    final decodedData = json.decode(response.body);
    final leg = Direction.fromJsonMap(decodedData['routes'][0]['legs'][0]);
    return leg;
  }
}
