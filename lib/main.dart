import 'package:flutter/material.dart';
import 'screens/city_list.dart';
import 'screens/city_form.dart';
import 'screens/weather_details.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Tempo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CityListScreen(),
      routes: {
        '/addCity': (context) => AddCityForm(),
        '/weatherDetails': (context) => WeatherDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
