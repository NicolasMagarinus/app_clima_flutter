import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

Future<Weather> fetchWeather(String cityName) async {
  final response = await http.get(
    Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=53e5b92779599852acc27d7d7e8fedd8&units=metric&lang=pt_br'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather');
  }
}

Future<void> addCity(String cityName) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/cities'),
    body: json.encode({'name': cityName}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode != 201) {
    throw Exception('Failed to add city');
  }
}

Future<void> deleteCity(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/cities/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to delete city');
  }
}

Future<void> updateCity(int id, String cityName) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/cities/$id'),
    body: json.encode({'name': cityName}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update city');
  }
}