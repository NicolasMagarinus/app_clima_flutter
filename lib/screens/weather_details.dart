import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Weather weather = ModalRoute.of(context)!.settings.arguments as Weather;

    return Scaffold(
      appBar: AppBar(
        title: Text(weather.cidade),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Temperatura: ${weather.temperatura}°C'),
            Text('Descrição: ${weather.descricao}'),
            Text('Humidade: ${weather.humidade}%'),
            Text('Velocidade do vento: ${weather.velocidadeVento} m/s'),
          ],
        ),
      ),
    );
  }
}
