import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;

  WeatherTile({required this.weather});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(weather.cidade),
      subtitle: Text('${weather.temperatura}°C, ${weather.descricao}'),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/weatherDetails',
          arguments: weather,
        );
      },
    );
  }
}
