import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/city_provider.dart';
import '../widgets/weather_tile.dart';

class CityListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('App Tempo', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cityProvider.cities.length,
              itemBuilder: (context, index) {
                return WeatherTile(weather: cityProvider.cities[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final newCity = await Navigator.pushNamed(context, '/addCity');
                  if (newCity != null) {
                    cityProvider.addCity(newCity as String);
                  }
                },
                child: Text('Adicionar Cidade'),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Mapa'),
              onTap: () {
                Navigator.pushNamed(context, 'MapScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
