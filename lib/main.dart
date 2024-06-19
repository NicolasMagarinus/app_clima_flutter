import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/city_list.dart';
import 'screens/city_form.dart';
import 'screens/weather_details.dart';
import 'providers/city_provider.dart';
import 'models/weather.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CityProvider(),
      child: MaterialApp(
        title: 'App Tempo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CityListScreen(),
        routes: {
          '/addCity': (context) => AddCityForm(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/weatherDetails') {
            final Weather weather = settings.arguments as Weather;
            return MaterialPageRoute(
              builder: (context) {
                return WeatherDetailsScreen(weather: weather);
              },
            );
          }
          return null;
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
