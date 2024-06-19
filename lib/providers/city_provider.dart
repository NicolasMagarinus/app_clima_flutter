import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

class CityProvider with ChangeNotifier {
  List<Weather> _cities = [];

  List<Weather> get cities => _cities;

  void addCity(String cityName) async {
    Weather weather = await fetchWeather(cityName);
    _cities.add(weather);
    notifyListeners();
  }

  void removeCity(Weather city) {
    _cities.remove(city);
    notifyListeners();
  }

  void updateCity(Weather oldCity, String newCityName) async {
    int index = _cities.indexOf(oldCity);
    Weather newWeather = await fetchWeather(newCityName);
    _cities[index] = newWeather;
    notifyListeners();
  }
}
