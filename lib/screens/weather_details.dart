import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/weather.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final Weather weather;

  WeatherDetailsScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.cidade),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Temperatura: ${weather.temperatura}°C'),
              Text('Descrição: ${weather.descricao}'),
              Text('Humidade: ${weather.humidade}%'),
              Text('Velocidade do vento: ${weather.velocidadeVento} m/s'),
              SizedBox(height: 20),
              Container(
                height: 300,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(weather.latitude, weather.longitude),
                    zoom: 10,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId(weather.cidade),
                      position: LatLng(weather.latitude, weather.longitude),
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
