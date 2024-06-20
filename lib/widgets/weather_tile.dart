import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather.dart';
import '../providers/city_provider.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;

  WeatherTile({required this.weather});

  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context, listen: false);

    return ListTile(
      title: Text(weather.cidade, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text('${weather.temperatura}°C, ${weather.descricao}'),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/weatherDetails',
          arguments: weather,
        );
      },
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'Editar') {
            _editCity(context, cityProvider);
          } else if (value == 'Remover') {
            cityProvider.removeCity(weather);
          }
        },
        itemBuilder: (BuildContext context) {
          return {'Editar', 'Remover'}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    );
  }

  void _editCity(BuildContext context, CityProvider cityProvider) async {
    final newCityName = await Navigator.pushNamed(context, '/addCity');
    if (newCityName != null) {
      cityProvider.updateCity(weather, newCityName as String);
    }
  }
}
