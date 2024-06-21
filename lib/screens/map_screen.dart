
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  final List<String> cities;

  MapScreen({required this.cities});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    for (String city in widget.cities) {
      List<Location> locations = await locationFromAddress(city);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        String translatedCity = _translateCityName(city);
        _markers.add(
          Marker(
            markerId: MarkerId(city),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(
              title: translatedCity,
            ),
          ),
        );
      }
    }
    setState(() {});
  }

  String _translateCityName(String cityName) {
    Map<String, String> translations = {
      'New York': 'Nova York',
      'Los Angeles': 'Los Angeles',
      'Chicago': 'Chicago',
    
    };
    return translations[cityName] ?? cityName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa das Cidades'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 2,
        ),
      ),
    );
  }
}
